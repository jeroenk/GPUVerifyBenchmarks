//pass
//--num_groups=16384 --local_size=128

#pragma OPENCL EXTENSION cl_khr_fp64: enable
__kernel void Mul1(__global double *data, int nIters) {
  int gid = get_global_id(0), globalSize = get_global_size(0);
  double s = data[gid]-data[gid]+0.999f;
  double s0 = s + 0;
  for (int j=0 ; j<nIters ; ++j) {
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
 s0=s0*s0*1.01f;
  }
   data[gid] = s0;
}
