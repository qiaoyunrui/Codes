# -*- coding: utf-8 -*-
import math, random

# 种群的设计
class Population:
    def __init__(self, size, chromosome_size, cp, mp, gen_max):
        # 种群信息
        self.individuals = []  # 个体集合
        self.fitness = []  # 个体适应度集合
        self.selector_probability = []  # 个体选择概率集合
        self.new_individuals = []  # 新一代个体集合
        self.elitist = {'chromosome': [0, 0], 'fitness': 0, 'age': 0}  # 最佳个体的信息

        self.size = size  # 种群所包含的个体数
        self.chromosome_size = chromosome_size  # 个体的染色体长度
        self.crossover_probability = cp  # 个体之间交叉概率
        self.mutation_probability = mp  # 个体之间的变异概率

        self.generation_max = gen_max  # 种群进化的最大世代数
        self.age = 0  # 种群当前所处世代

        # 随机产生的初始个体集数，并将新一代个体、适应度、选择概率等集合以 0 值进行初始化
        v = 2 ** self.chromosome_size - 1
        for i in range(self.size):
            self.individuals.append([random.randint(0, v), random.randint(0, v)])
            self.new_individuals.append([0, 0])
            self.fitness.append(0)
            self.selector_probability.append(0)

    # 将一个染色体 chromosome 映射为区间 interval 之间的数值
    def decode(self, interval, chromosome):
        d = interval[1] - interval[0]
        n = float(2 ** self.chromosome_size - 1)
        return interval[0] + chromosome * d / n

    # 适应度函数，根据个体的两个染色体计算出该个体的适应度，即所求解的目标函数
    def fitness_func(self, chromosome1, chromosome2):
        interval = [-10.0, 10.0]
        (x, y) = (self.decode(interval, chromosome1),
                  self.decode(interval, chromosome2))
        n = lambda x, y: math.sin(math.sqrt(x * x + y * y)) ** 2 - 0.5
        d = lambda x, y: (1 + 0.001 * (x * x + y * y)) ** 2
        func = lambda x, y: 0.5 - n(x, y) / d(x, y)
        return func(x, y)

    # 评估种群中的个体集合 self.individuals 中各个个体的适应度
    # 即各个个体的两个染色体代入 fitness_func 函数，并将结果保存在 self.fitness 列表中，
    # 然后将 self.fitness 中的各个个体除以所有个体适应度之和，得到各个个体的生存概率。
    def evaluate(self):
        sp = self.selector_probability
        for i in range(self.size):
            self.fitness[i] = self.fitness_func(self.individuals[i][0], self.individuals[i][1])
            ft_sum = sum(self.fitness)
            for i in range(self.size):
                sp[i] = self.fitness[i] / float(ft_sum)
            for i in range(1, self.size):
                sp[i] = sp[i] + sp[i - 1]

    # 基于轮盘赌博机的选择
    def select(self):
        (t, i) = (random.random(), 0)
        for p in self.selector_probability:
            if p > t:
                break
            i = i + 1
        return i

    # 染色体交叉模拟
    # 将两个染色体进行交叉配对，从而生成两个新的染色体
    def cross(self, chromosome1, chromosome2):
        p = random.random()
        n = 2 ** self.chromosome_size - 1
        if chromosome1 != chromosome2 and p < self.crossover_probability:
            t = random.randint(1, self.chromosome_size - 1)
            mask = n << t
            (r1, r2) = (chromosome1 & mask, chromosome2 & mask)
            mask = n >> (self.chromosome_size - t)
            (l1, l2) = (chromosome1 & mask, chromosome2 & mask)
            (chromosome1, chromosome2) = (r1 + l2, r2 + l1)
        return chromosome1, chromosome2

    # 染色体变异模拟
    def mutate(self, chromosome):
        p = random.random()
        if p < self.mutation_probability:
            t = random.randint(1, self.chromosome_size)
            mask1 = 1 << (t - 1)
            mask2 = chromosome & mask1
            if mask2 > 0:
                chromosome = chromosome & (~mask2)
            else:
                chromosome = chromosome ^ mask1
        return chromosome

    # 进化过程
    # evolve 函数可以实现种群的一代进化计算，计算过程分为三个步骤：
    # 1. 使用 evaluate 函数评估当前种群的适应度，并计算各个个体的选择概率
    # 2. 对于数量为 self.size 的 self.individuals 集合，循环 self.size / 2 次，
    # 每次从 self.individuals 中选出2 个个体，对其进行交叉和变异操作，并将计算结果保存于新的集合 self.new_individuals 中
    # 3. 用种群进化生成的新个体集合 self.new_individuals 替换当前个体集合
    def evolve(self):
        indvs = self.individuals
        new_indivs = self.new_individuals

        # 计算适应度及选择概率
        self.evaluate()

        # 进化操作
        i = 0
        while True:
            # 选择两个个体，进行交叉与变异，产生新的种群
            idv1 = self.select()
            idv2 = self.select()

            # 交叉
            (idv1_x, idv1_y) = (indvs[idv1][0], indvs[idv1][1])
            (idv2_x, idv2_y) = (indvs[idv2][0], indvs[idv2][1])
            (idv1_x, idv2_x) = self.cross(idv1, idv2_x)
            (idv1_y, idv2_y) = self.cross(idv1_y, idv2_y)

            # 变异
            (idv1_x, idv1_y) = (self.mutate(idv1_x), self.mutate(idv1_y))
            (idv2_x, idv2_y) = (self.mutate(idv2_x), self.mutate(idv2_y))

            (new_indivs[i][0], new_indivs[i][1]) = (idv1_x, idv2_y)
            (new_indivs[i + 1][0], new_indivs[i + 1][1]) = (idv2_x, idv2_y)

            # 判断进化过程是否结束
            i = i + 2
            if i >= self.size:
                break

        # 更新换代
        for i in range(self.size):
            self.individuals[i][0] = self.new_individuals[i][0]
            self.individuals[i][0] = self.new_individuals[i][1]

    def run(self):
        for i in range(self.generation_max):
            self.evolve()
            print(i, max(self.fitness), sum(self.fitness) / self.size, min(self.fitness))


if __name__ == '__main__':
    pop = Population(50, 24, 0.8, 0.1, 150)
    pop.run()
