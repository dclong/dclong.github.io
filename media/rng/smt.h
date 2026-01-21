/**
 * Using static mutex avoids the problem of non-copyable.
 *
 * Another way is to define a copy constructor manually.
 *
 * 1. use static mutex (easy solution)
 *
 * 2. define thread safe copy constructor (not easy, you can use c++11 constructor forward ...)
 *
 * 3. use singleton class (not so easy)
 */


#ifndef DCLONG_SMT_H_
#define DCLONG_SMT_H_

#include <random>
#include <mutex>

namespace dclong {
	using namespace std;
template<
    class UIntType,
    size_t w, size_t n, size_t m, size_t r,
    UIntType a, size_t u, UIntType d, size_t s,
    UIntType b, size_t t,
    UIntType c, size_t l, UIntType f
> class smt : public mersenne_twister_engine<UIntType,w,n,m,r,a,u,d,s,b,t,c,l,f>{
	private:
		static mutex _mutex;
	public:
		UIntType operator()(){
			lock_guard<mutex> lck(_mutex);
			return mersenne_twister_engine<UIntType,w,n,m,r,a,u,d,s,b,t,c,l,f>::operator()();
		}
};

template<
    class UIntType,
    size_t w, size_t n, size_t m, size_t r,
    UIntType a, size_t u, UIntType d, size_t s,
    UIntType b, size_t t,
    UIntType c, size_t l, UIntType f
>
mutex smt<UIntType,w,n,m,r,a,u,d,s,b,t,c,l,f>::_mutex;

/**
 * The specializations \mt11213b and \mt19937 are from
 *
 *  @blockquote
 *  "Mersenne Twister: A 623-dimensionally equidistributed
 *  uniform pseudo-random number generator", Makoto Matsumoto
 *  and Takuji Nishimura, ACM Transactions on Modeling and
 *  Computer Simulation: Special Issue on Uniform Random Number
 *  Generation, Vol. 8, No. 1, January 1998, pp. 3-30.
 *  @endblockquote
 */
typedef smt<uint32_t,32,351,175,19,0xccab8ee7,
    11,0xffffffff,7,0x31b6ab00,15,0xffe50000,17,1812433253> smt11213b;

typedef smt<uint32_t,32,624,397,31,0x9908b0df,
    11,0xffffffff,7,0x9d2c5680,15,0xefc60000,18,1812433253> smt19937;

#if !defined(BOOST_NO_INT64_T) && !defined(BOOST_NO_INTEGRAL_INT64_T)
typedef smt<uint64_t,64,312,156,31,
    UINT64_C(0xb5026f5aa96619e9),29,UINT64_C(0x5555555555555555),17,
    UINT64_C(0x71d67fffeda60000),37,UINT64_C(0xfff7eee000000000),43,
    UINT64_C(6364136223846793005)> smt19937_64;
#endif
}

#endif
