#include<inttypes.h>

typedef unsigned __int128 uint128_t;	//GCC 128-bit int support

void store_uproad(uint128_t *dest, uint64_t x, uint64_t y) {
	*dest = x * (uint128_t) y;
}