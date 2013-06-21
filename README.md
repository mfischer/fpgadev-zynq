# Zynq project

Simple sample project for not having to fiddle with XPS to build Zynq based projects.


## Building
1. Create subdirectory for your project in top by copying the top/zc702
directory.
2. in *top/yourtopdir* type *make clean* && *make* to create *top/yourtopdir/build/yourtopfile.bit*
3. (optional) use *make promgen* to create *top/yourtopdir/build/yourtopfile.bin*


## Notes
* Make sure you sourced Xilinx' settings files before running make
* Sometimes you have to *make clean* if your build failed
