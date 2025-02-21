savedcmd_arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb := gcc -E -Wp,-MMD,arch/arm/boot/dts/arm/.vexpress-v2p-ca5s.dtb.d.pre.tmp -nostdinc -I ../scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/arm/.vexpress-v2p-ca5s.dtb.dts.tmp ../arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts ; ./scripts/dtc/dtc -o arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb -b 0 -i../arch/arm/boot/dts/arm/ -i../scripts/dtc/include-prefixes -Wno-unique_unit_address -Wno-unit_address_vs_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-simple_bus_reg   -d arch/arm/boot/dts/arm/.vexpress-v2p-ca5s.dtb.d.dtc.tmp arch/arm/boot/dts/arm/.vexpress-v2p-ca5s.dtb.dts.tmp ; cat arch/arm/boot/dts/arm/.vexpress-v2p-ca5s.dtb.d.pre.tmp arch/arm/boot/dts/arm/.vexpress-v2p-ca5s.dtb.d.dtc.tmp > arch/arm/boot/dts/arm/.vexpress-v2p-ca5s.dtb.d 

source_arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb := ../arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts

deps_arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb := \
  ../arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi \
  ../scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/arm-gic.h \
  ../scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \

arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb: $(deps_arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb)

$(deps_arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dtb):
