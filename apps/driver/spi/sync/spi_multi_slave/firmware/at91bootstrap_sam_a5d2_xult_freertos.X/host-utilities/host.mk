ifdef NIX_SHELL
MKDIR:=mkdir
DATE:=date
DEV_NULL:=/dev/null
else
GNU_MKDIR?="mkdir"
MKDIR:=$(GNU_MKDIR)
GNU_DATE?="date"
DATE:=$(GNU_DATE)
DEV_NULL:=nul
endif

ifndef HOSTAR
HOSTAR:=ar
endif
ifndef HOSTAS
HOSTAS:=as
endif
ifndef HOSTCC
HOSTCC:=gcc
endif
ifndef HOSTCPP
HOSTCPP:=cpp
endif
ifndef HOSTLD
HOSTLD:=ld
endif
ifndef HOSTLN
HOSTLN:=ln
endif
ifndef HOSTNM
HOSTNM:=nm
endif

ifdef NIX_SHELL
HOSTAR:=$(shell $(CONFIG_SHELL)	 -c "which $(HOSTAR)"  || type -p $(HOSTAR)  || echo ar)
HOSTAS:=$(shell $(CONFIG_SHELL)  -c "which $(HOSTAS)"  || type -p $(HOSTAS)  || echo as)
HOSTCC:=$(shell $(CONFIG_SHELL)  -c "which $(HOSTCC)"  || type -p $(HOSTCC)  || echo gcc)
HOSTCPP:=$(shell $(CONFIG_SHELL) -c "which $(HOSTCPP)" || type -p $(HOSTCPP) || echo cpp)
HOSTLD:=$(shell $(CONFIG_SHELL)  -c "which $(HOSTLD)"  || type -p $(HOSTLD)  || echo ld)
HOSTLN:=$(shell $(CONFIG_SHELL)  -c "which $(HOSTLN)"  || type -p $(HOSTLN)  || echo ln)
HOSTNM:=$(shell $(CONFIG_SHELL)  -c "which $(HOSTNM)"  || type -p $(HOSTNM)  || echo nm)
endif

ifndef CFLAGS_FOR_BUILD
CFLAGS_FOR_BUILD:=-g -O2
endif
ifndef CXXFLAGS_FOR_BUILD
CXXFLAGS_FOR_BUILD:=-g -O2
endif
ifndef FCFLAGS_FOR_BUILD
FCFLAGS_FOR_BUILD:=-g -O2
endif
export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD

