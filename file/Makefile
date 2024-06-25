.PHONY:
	vcs sim verdi clean

vcs:
	vcs -full64 -sverilog -debug_access+all -f file.list -timescale=1ns/1ns \
	-kdb -lca -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed
# -full64：64位的系统需要添加
# -sverilog：识别systemverilog的语法
# -debug_access+all：生成debug所需文件
# -f file.list：将file.list中所有.v文件进行编译
# -timescale=1ns/1ns：设置仿真精度
# -kdb：生成KDB文件，仿真时生成verdi的库文件simv.daidir
# -lca：支持动态数据类型
# -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed：指定编译选项
sim:
	./simv -verdi
# -l run.log：记录终端打印信息
# -verdi：打开verdi进行动态调试
# +fsdb+functions：抓取function和task内部信号
verdi:
	verdi -ssf rtl.fsdb
# -ssf rtl.fsdb：打开波形文件
clean:
	rm -rf csrc simv* *.lib *.lib++ nLint* verdi_config_file
	rm -rf *.log *.vpd *.fsdb* *.key *log rtl.fsdb*
