//PASS
//--local_size=[32,4,4] --num_groups=[16,16,1]

#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *A, __global double *B, int n, long c0)
{
  __requires(n == 512);
    long b0 = get_group_id(0), b1 = get_group_id(1);
    long t0 = get_local_id(0), t1 = get_local_id(1), t2 = get_local_id(2);

    #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    {
      __requires(((((n) >= (3)) & ((n) <= (2147483647))) & ((c0) >= (1))) & ((c0) <= (500)));
      for (long c1 = 32 * b0; c1 < n - 1; c1 += 8192)
        if (n >= t0 + c1 + 2 && t0 + c1 >= 1)
          for (long c2 = 32 * b1; c2 < n - 1; c2 += 8192)
            for (long c3 = 0; c3 < n - 1; c3 += 32) {
              // shared
              for (long c5 = max(t1, ((t1 + c2 + 3) % 4) - c2 + 1); c5 <= min(31, n - c2 - 2); c5 += 4)
                for (long c6 = max(t2, ((t2 + c3 + 3) % 4) - c3 + 1); c6 <= min(31, n - c3 - 2); c6 += 4)
                  A[((t0 + c1) * n + (c2 + c5)) * n + (c3 + c6)] = ((((0.125 * ((B[((t0 + c1 + 1) * n + (c2 + c5)) * n + (c3 + c6)] - (2. * B[((t0 + c1) * n + (c2 + c5)) * n + (c3 + c6)])) + B[((t0 + c1 - 1) * n + (c2 + c5)) * n + (c3 + c6)])) + (0.125 * ((B[((t0 + c1) * n + (c2 + c5 + 1)) * n + (c3 + c6)] - (2. * B[((t0 + c1) * n + (c2 + c5)) * n + (c3 + c6)])) + B[((t0 + c1) * n + (c2 + c5 - 1)) * n + (c3 + c6)]))) + (0.125 * ((B[((t0 + c1) * n + (c2 + c5)) * n + (c3 + c6 + 1)] - (2. * B[((t0 + c1) * n + (c2 + c5)) * n + (c3 + c6)])) + B[((t0 + c1) * n + (c2 + c5)) * n + (c3 + c6 - 1)]))) + B[((t0 + c1) * n + (c2 + c5)) * n + (c3 + c6)]);
            }
      __function_wide_invariant(__write_implies(A, (((((((((((((((32) * (b0)) + (t0)) >= (0)) & ((((32) * (b0)) + (t0)) <= (8191))) & ((n) >= ((((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & ((((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (1))) & ((n) >= (((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) % (n)) + (2)))) & (((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) % (n)) >= (1))) & ((n) >= ((((__write_offset_bytes(A)) / (sizeof(double))) % (n)) + (2)))) & ((((__write_offset_bytes(A)) / (sizeof(double))) % (n)) >= (1))) & ((((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) % (n)) % (8192)) >= ((32) * (b1)))) & ((((32) * (b1)) + (31)) >= (((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) % (n)) % (8192)))) & ((((((32) * (b0)) + (t0)) - (((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0))) & ((((t1) - ((((__write_offset_bytes(A)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0))) & ((((t2) - (((__write_offset_bytes(A)) / (sizeof(double))) % (n))) % (4)) == (0))));
      __function_wide_invariant(__read_implies(B, (((((((((((((((((((((((((((((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (2)) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (2))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) + (1)))) & (((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) <= (1))) & (((((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) + ((4) * ((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) / (4)))) + (30)) >= ((((((((-((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4))) + ((32) * (b1))) + ((8192) * (t1))) + ((8191) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (32)) % (8192)) + (t1)) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))))) & (((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) >= ((((((t1) + (t2)) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + ((3) * (((__read_offset_bytes(B)) / (sizeof(double))) % (n)))) + (1)) % (4)))) & ((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0))) | (((((((((((b0) == (0)) & ((t0) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (3))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) + (1)))) & ((n) >= ((((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) + ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) + (1)))) & (((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) <= (1))) & (((((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) + ((4) * ((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) / (4)))) + (30)) >= ((((((((-((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4))) + ((32) * (b1))) + ((8192) * (t1))) + ((8191) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (32)) % (8192)) + (t1)) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))))) & (((((t1) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (1)) % (4)) >= ((((((t1) + (t2)) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + ((3) * (((__read_offset_bytes(B)) / (sizeof(double))) % (n)))) + (1)) % (4))))) | ((((((((((((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (2)) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (1)))) & (((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) >= (4))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (1))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (1))) & ((((((((((32) * (b0)) + ((32) * (b1))) + (t0)) + ((8192) * (t1))) + ((8191) * (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)))) + ((8191) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (32)) % (8192)) <= (31))) & (((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) + (1)) % (8192)) == (0))) & ((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0))) & ((((t2) - (((__read_offset_bytes(B)) / (sizeof(double))) % (n))) % (4)) == (0)))) | ((((((((((((((((32) * (b0)) + (t0)) >= (0)) & ((((32) * (b0)) + (t0)) <= (8191))) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (3)))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (0))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (1))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) % (8192)) >= ((32) * (b1)))) & ((((32) * (b1)) + (31)) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) % (8192)))) & (((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) + (8191)) % (8192)) == (0))) & ((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0))) & ((((t2) - (((__read_offset_bytes(B)) / (sizeof(double))) % (n))) % (4)) == (0)))) | ((((((((((((((((32) * (b0)) + (t0)) >= (0)) & ((((32) * (b0)) + (t0)) <= (8191))) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (1))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (3)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (0))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (1))) & (((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (1)) % (8192)) >= ((32) * (b1)))) & ((((32) * (b1)) + (31)) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (1)) % (8192)))) & ((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0))) & (((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) + (3)) % (4)) == (0))) & ((((t2) - (((__read_offset_bytes(B)) / (sizeof(double))) % (n))) % (4)) == (0)))) | ((((((((((((((((32) * (b0)) + (t0)) >= (0)) & ((((32) * (b0)) + (t0)) <= (8191))) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (1))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (1))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (3)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (0))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) % (8192)) >= ((32) * (b1)))) & ((((32) * (b1)) + (31)) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) % (8192)))) & ((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0))) & ((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0))) & (((((t2) - (((__read_offset_bytes(B)) / (sizeof(double))) % (n))) + (3)) % (4)) == (0)))) | ((((((((((((b0) == (0)) & ((b1) == (0))) & ((t0) == (1))) & ((t1) >= (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (t1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) <= (2))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (((__read_offset_bytes(B)) / (sizeof(double))) % (n))) >= ((t1) + (2)))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (((__read_offset_bytes(B)) / (sizeof(double))) % (n))))) & (((n) + (t1)) >= (((((((((t1) + (t2)) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + ((3) * (((__read_offset_bytes(B)) / (sizeof(double))) % (n)))) + (1)) % (4)) + ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) + (((__read_offset_bytes(B)) / (sizeof(double))) % (n))) + (1)))) & (((t1) + (1)) >= (((((((t1) + (t2)) + ((3) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + ((3) * (((__read_offset_bytes(B)) / (sizeof(double))) % (n)))) + (1)) % (4)) + ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))))) | ((((((((((b1) == (0)) & ((t1) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (3))) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (1))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (2))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & (((((((t0) + (t2)) + ((3) * (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)))) + ((3) * (((__read_offset_bytes(B)) / (sizeof(double))) % (n)))) + (1)) % (4)) <= (1))) & ((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0)))) | ((((((((((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (2)) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (1)) == (n))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (1))) & (((((((8191) * (n)) + ((32) * (b1))) + ((8192) * (t1))) - (8159)) % (8192)) <= (31))) & ((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0))) & (((((-(n)) + (t1)) + (2)) % (4)) == (0))) & ((((t2) - (((__read_offset_bytes(B)) / (sizeof(double))) % (n))) % (4)) == (0)))) | ((((((((((t2) == (1)) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (2))) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (2))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) == (1))) & (((((((32) * (b1)) + ((8192) * (t1))) + ((8191) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (31)) % (8192)) <= (31))) & ((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0))) & ((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0)))) | (((((((((((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (2)) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & (((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) >= (4))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (1)) == (n))) & (((((((32) * (b1)) + ((8192) * (t1))) + ((8191) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (31)) % (8192)) <= (31))) & ((((((32) * (b0)) + (t0)) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0))) & ((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0))) & (((((-(n)) + (t2)) + (2)) % (4)) == (0)))) | ((((((((((b0) == (0)) & ((b1) == (0))) & ((t0) <= (2))) & ((t1) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (2))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (1))) & ((n) >= ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) >= (t0))) & ((t0) >= ((((((t0) + (t2)) + ((3) * (((__read_offset_bytes(B)) / (sizeof(double))) % (n)))) + (3)) % (4)) + (1))))) | ((((((((((b0) == (0)) & ((t0) == (1))) & ((t2) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (3))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) == (1))) & (((((((32) * (b1)) + ((8192) * (t1))) + ((8191) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (31)) % (8192)) <= (31))) & ((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0)))) | ((((((((((b0) == (0)) & ((t0) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) >= (3))) & ((n) >= (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (1)) == (n))) & (((((((32) * (b1)) + ((8192) * (t1))) + ((8191) * ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)))) + (31)) % (8192)) <= (31))) & ((((t1) - ((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n))) % (4)) == (0))) & (((((-(n)) + (t2)) + (2)) % (4)) == (0)))) | ((((((((((b1) == (0)) & ((t1) == (1))) & ((t2) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) >= (3))) & ((n) >= ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) + (2)))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (1))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) == (1))) & ((((t0) - (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (32)) == (0))) & ((((((-32) * (b0)) - (t0)) + (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n))) % (8192)) == (0)))) | ((((((((((n) >= (4)) & ((b0) == (0))) & ((b1) == (0))) & ((t0) == (1))) & ((t1) == (2))) & ((t2) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (2))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) == (1)))) | ((((((((((n) >= (4)) & ((b0) == (0))) & ((b1) == (0))) & ((t0) == (2))) & ((t1) == (1))) & ((t2) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (2))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (1))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) == (1)))) | (((((((((b0) == (0)) & ((b1) == (0))) & ((t0) == (1))) & ((t1) == (1))) & ((t2) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (1))) & ((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) == (1)))) | ((((((((((n) >= (4)) & ((b0) == (0))) & ((b1) == (0))) & ((t0) == (1))) & ((t1) == (2))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (2))) & (((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (1)) == (n))) & (((((-(n)) + (t2)) + (2)) % (4)) == (0)))) | ((((((((((n) >= (4)) & ((b0) == (0))) & ((b1) == (0))) & ((t0) == (2))) & ((t1) == (1))) & ((((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) / (n)) % (n)) == (2))) & (((((__read_offset_bytes(B)) / (sizeof(double))) / (n)) % (n)) == (1))) & (((((__read_offset_bytes(B)) / (sizeof(double))) % (n)) + (1)) == (n))) & (((((-(n)) + (t2)) + (2)) % (4)) == (0)))));
    }
}
