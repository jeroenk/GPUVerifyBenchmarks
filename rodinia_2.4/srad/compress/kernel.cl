//pass
//--local_size=[512] --num_groups=[450]

#include "../common.h"

__kernel void 
compress_kernel(long d_Ne,
				__global fp* d_I){										// pointer to output image (DEVICE GLOBAL MEMORY)

	// indexes
	int bx = get_group_id(0);												// get current horizontal block index
	int tx = get_local_id(0);												// get current horizontal thread index
	int ei = (bx*NUMBER_THREADS)+tx;										// unique thread id, more threads than actual elements !!!

	// copy input to output & log uncompress
	if(ei<d_Ne){															// do only for the number of elements, omit extra threads

		d_I[ei] = log(d_I[ei])*255;												// exponentiate input IMAGE and copy to output image

	}

}
