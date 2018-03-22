long lt_cnt = 0;
long ge_cnt = 0;

//求两数之差绝对值
long absdiff_se(long x, long y) {
	long result;
	if (x < y) {
		lt_cnt++;
		result = y - x;
	} else {
		ge_cnt++;
		result = x - y;
	}
	return result;
}
