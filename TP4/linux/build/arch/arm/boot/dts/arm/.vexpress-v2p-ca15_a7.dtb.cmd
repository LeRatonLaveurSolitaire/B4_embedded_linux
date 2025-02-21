savedcmd_arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb := gcc -E -Wp,-MMD,arch/arm/boot/dts/arm/.vexpress-v2p-ca15_a7.dtb.d.pre.tmp -nostdinc -I ../scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/arm/.vexpress-v2p-ca15_a7.dtb.dts.tmp ../arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts ; ./scripts/dtc/dtc -o arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb -b 0 -i../arch/arm/boot/dts/arm/ -i../scripts/dtc/include-prefixes -Wno-unique_unit_address -Wno-unit_address_vs_reg -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-simple_bus_reg   -d arch/arm/boot/dts/arm/.vexpress-v2p-ca15_a7.dtb.d.dtc.tmp arch/arm/boot/dts/arm/.vexpress-v2p-ca15_a7.dtb.dts.tmp ; cat arch/arm/boot/dts/arm/.vexpress-v2p-ca15_a7.dtb.d.pre.tmp arch/arm/boot/dts/arm/.vexpress-v2p-ca15_a7.dtb.d.dtc.tmp > arch/arm/boot/dts/arm/.vexpress-v2p-ca15_a7.dtb.d 

source_arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb := ../arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts

deps_arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb := \
  ../arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi \
  ../scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/arm-gic.h \
  ../scripts/dtc/include-prefixes/dt-bindings/interrupt-controller/irq.h \

arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb: $(deps_arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb)

$(deps_arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dtb):
