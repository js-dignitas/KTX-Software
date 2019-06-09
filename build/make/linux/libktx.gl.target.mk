# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := libktx.gl
DEFS_Debug := \
	'-DKTX_OPENGL=1' \
	'-DKTX_USE_FUNCPTRS_FOR_VULKAN' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pedantic \
	-std=c99 \
	-Og \
	-g \
	-fPIC

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug :=

INCS_Debug := \
	-I$(srcdir)/include \
	-I$(srcdir)/other_include \
	-I$(VULKAN_SDK)/include

DEFS_Release := \
	'-DKTX_OPENGL=1' \
	'-DKTX_USE_FUNCPTRS_FOR_VULKAN' \
	'-DNDEBUG'

# Flags passed to all source files.
CFLAGS_Release := \
	-pedantic \
	-std=c99 \
	-O3 \
	-fPIC

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release :=

INCS_Release := \
	-I$(srcdir)/include \
	-I$(srcdir)/other_include \
	-I$(VULKAN_SDK)/include

OBJS := \
	$(obj).target/$(TARGET)/lib/checkheader.o \
	$(obj).target/$(TARGET)/lib/dfdutils/createdfd.o \
	$(obj).target/$(TARGET)/lib/dfdutils/dfd4vkformat.o \
	$(obj).target/$(TARGET)/lib/dfdutils/interpretdfd.o \
	$(obj).target/$(TARGET)/lib/dfdutils/printdfd.o \
	$(obj).target/$(TARGET)/lib/errstr.o \
	$(obj).target/$(TARGET)/lib/etcdec.o \
	$(obj).target/$(TARGET)/lib/etcunpack.o \
	$(obj).target/$(TARGET)/lib/filestream.o \
	$(obj).target/$(TARGET)/lib/glloader.o \
	$(obj).target/$(TARGET)/lib/hashlist.o \
	$(obj).target/$(TARGET)/lib/hashtable.o \
	$(obj).target/$(TARGET)/lib/info.o \
	$(obj).target/$(TARGET)/lib/memstream.o \
	$(obj).target/$(TARGET)/lib/swap.o \
	$(obj).target/$(TARGET)/lib/texture.o \
	$(obj).target/$(TARGET)/lib/vkformat_prohibited.o \
	$(obj).target/$(TARGET)/lib/vkformat_str.o \
	$(obj).target/$(TARGET)/lib/writer.o \
	$(obj).target/$(TARGET)/lib/writer_apiv1.o \
	$(obj).target/$(TARGET)/lib/writer_v2.o \
	$(obj).target/$(TARGET)/lib/vkloader.o \
	$(obj).target/$(TARGET)/lib/vk_funcs.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/vulkan_headers.stamp $(obj).target/libgl.stamp

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cxx FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cxx FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cxx FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-g

LDFLAGS_Release :=

LIBS := \
	-lGL

$(obj).target/libktx.gl.so: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/libktx.gl.so: LIBS := $(LIBS)
$(obj).target/libktx.gl.so: LD_INPUTS := $(OBJS)
$(obj).target/libktx.gl.so: TOOLSET := $(TOOLSET)
$(obj).target/libktx.gl.so: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink)

all_deps += $(obj).target/libktx.gl.so
# Add target alias
.PHONY: libktx.gl
libktx.gl: $(builddir)/lib.target/libktx.gl.so

# Copy this to the shared library output path.
$(builddir)/lib.target/libktx.gl.so: TOOLSET := $(TOOLSET)
$(builddir)/lib.target/libktx.gl.so: $(obj).target/libktx.gl.so FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/lib.target/libktx.gl.so
# Short alias for building this shared library.
.PHONY: libktx.gl.so
libktx.gl.so: $(obj).target/libktx.gl.so $(builddir)/lib.target/libktx.gl.so

# Add shared library to "all" target.
.PHONY: all
all: $(builddir)/lib.target/libktx.gl.so

