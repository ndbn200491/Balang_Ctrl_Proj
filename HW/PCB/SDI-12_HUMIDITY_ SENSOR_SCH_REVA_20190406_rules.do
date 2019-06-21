# start of do file

################################################################################
# CLASS DEFINITIONS                                                            #
################################################################################
define (class POWER VCC_3V3 )
#forget class POWER

################################################################################
# LAYERSET DEFINITIONS                                                         #
################################################################################

################################################################################
# CLEARANCE RULES                                                              #
################################################################################
# rule assignments for PCB clearances                                          #
################################################################################
rule PCB (width 0.2000)
rule PCB (clearance 0.2000 (type buried_via_gap))
rule PCB (clearance 0.2000 (type wire_wire))
rule PCB (clearance 0.2000 (type wire_smd))
rule PCB (clearance 0.2000 (type wire_pin))
rule PCB (clearance 0.2500 (type wire_via))
rule PCB (clearance 0.1900 (type smd_smd))
rule PCB (clearance 0.1900 (type smd_pin))
rule PCB (clearance 0.2500 (type smd_via))
rule PCB (clearance 0.1900 (type pin_pin))
rule PCB (clearance 0.2500 (type pin_via))
rule PCB (clearance 0.2500 (type via_via))
rule PCB (clearance 0.2500 (type test_test))
rule PCB (clearance 0.2500 (type test_wire))
rule PCB (clearance 0.2500 (type test_smd))
rule PCB (clearance 0.2500 (type test_pin))
rule PCB (clearance 0.2500 (type test_via))
rule PCB (clearance 0 (type area_wire))
rule PCB (clearance 0 (type area_smd))
rule PCB (clearance 0 (type area_area))
rule PCB (clearance 0 (type area_pin))
rule PCB (clearance 0 (type area_via))
rule PCB (clearance 0 (type area_test))

rule PCB (clearance 0.2500 (type microvia_microvia))
set microvia_microvia off
rule PCB (clearance 0.2500 (type microvia_thrupin))
set microvia_thrupin off
rule PCB (clearance 0.2500 (type microvia_smdpin))
set microvia_smdpin off
rule PCB (clearance 0.2500 (type microvia_thruvia))
set microvia_thruvia off
rule PCB (clearance 0.2500 (type microvia_bbvia))
set microvia_bbvia off
rule PCB (clearance 0.2500 (type microvia_wire))
set microvia_wire off
rule PCB (clearance 0.2500 (type bbvia_bbvia))
set bbvia_bbvia on
rule PCB (clearance 0.2500 (type microvia_testpin))
set microvia_testpin off
rule PCB (clearance 0.2500 (type bbvia_thrupin))
set bbvia_thrupin on
rule PCB (clearance 0.2500 (type microvia_testvia))
set microvia_testvia off
rule PCB (clearance 0.2500 (type bbvia_smdpin))
set bbvia_smdpin on
rule PCB (clearance 0.2500 (type microvia_bondpad))
set microvia_bondpad off
rule PCB (clearance 0.2500 (type bbvia_thruvia))
set bbvia_thruvia on
rule PCB (clearance 0.2500 (type microvia_area))
set microvia_area off
rule PCB (clearance 0.2500 (type bbvia_wire))
set bbvia_wire on
rule PCB (clearance 0.1900 (type nhole_pin))
set nhole_pin on
rule PCB (clearance 0.2500 (type nhole_via))
set nhole_via on
rule PCB (clearance 0.2500 (type bbvia_area))
set bbvia_area on
rule PCB (clearance 0.2000 (type nhole_wire))
set nhole_wire on
rule PCB (clearance 0.2500 (type nhole_area))
set nhole_area on
rule PCB (clearance 0.1900 (type nhole_nhole))
set nhole_nhole on
rule PCB (clearance 0 (type mhole_pin))
set mhole_pin on
rule PCB (clearance 0.2500 (type bbvia_testpin))
set bbvia_testpin on
rule PCB (clearance 0 (type mhole_via))
set mhole_via on
rule PCB (clearance 0.2500 (type bbvia_testvia))
set bbvia_testvia on
rule PCB (clearance 0 (type mhole_wire))
set mhole_wire on
rule PCB (clearance 0 (type mhole_area))
set mhole_area on
rule PCB (clearance 0 (type mhole_nhole))
set mhole_nhole on
rule PCB (clearance 0 (type mhole_mhole))
set mhole_mhole on
rule PCB (clearance 0.2500 (type bbvia_bondpad))
set bbvia_bondpad on

################################################################################
# rule assignments for class clearances                                        #
################################################################################

################################################################################
# rule assignments for class layer clearances                                  #
################################################################################

################################################################################
# rule assignments for net clearances                                          #
################################################################################

################################################################################
# rule assignments for class class clearances                                  #
################################################################################
rule class_class POWER POWER (clearance 0.2000 (type buried_via_gap))
rule class_class POWER POWER (clearance 0.3000 (type wire_wire))
rule class_class POWER POWER (clearance 0.3000 (type wire_smd))
rule class_class POWER POWER (clearance 0.3000 (type wire_pin))
rule class_class POWER POWER (clearance 0.3000 (type wire_via))
rule class_class POWER POWER (clearance 0.3000 (type smd_smd))
rule class_class POWER POWER (clearance 0.3000 (type smd_pin))
rule class_class POWER POWER (clearance 0.3000 (type smd_via))
rule class_class POWER POWER (clearance 0.3000 (type pin_pin))
rule class_class POWER POWER (clearance 0.3000 (type pin_via))
rule class_class POWER POWER (clearance 0.3000 (type via_via))
rule class_class POWER POWER (clearance 0.3000 (type test_test))
rule class_class POWER POWER (clearance 0.3000 (type test_wire))
rule class_class POWER POWER (clearance 0.3000 (type test_smd))
rule class_class POWER POWER (clearance 0.3000 (type test_pin))
rule class_class POWER POWER (clearance 0.3000 (type test_via))
rule class_class POWER POWER (clearance 0.3000 (type microvia_microvia))
rule class_class POWER POWER (clearance 0.3000 (type microvia_thrupin))
rule class_class POWER POWER (clearance 0.3000 (type microvia_smdpin))
rule class_class POWER POWER (clearance 0.3000 (type microvia_thruvia))
rule class_class POWER POWER (clearance 0.3000 (type microvia_bbvia))
rule class_class POWER POWER (clearance 0.3000 (type microvia_wire))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_bbvia))
rule class_class POWER POWER (clearance 0.3000 (type microvia_testpin))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_thrupin))
rule class_class POWER POWER (clearance 0.3000 (type microvia_testvia))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_smdpin))
rule class_class POWER POWER (clearance 0.3000 (type microvia_bondpad))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_thruvia))
rule class_class POWER POWER (clearance 0.3000 (type microvia_area))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_wire))
rule class_class POWER POWER (clearance 0.3000 (type nhole_pin))
rule class_class POWER POWER (clearance 0.3000 (type nhole_via))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_area))
rule class_class POWER POWER (clearance 0.3000 (type nhole_wire))
rule class_class POWER POWER (clearance 0.3000 (type nhole_area))
rule class_class POWER POWER (clearance 0.3000 (type nhole_nhole))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_testpin))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_testvia))
rule class_class POWER POWER (clearance 0.3000 (type bbvia_bondpad))

################################################################################
# rule assignments for class class layer clearances                            #
################################################################################

################################################################################
# SAMENET CLEARANCE RULES                                                      #
################################################################################
# rule assignments for PCB clearances                                          #
################################################################################
rule PCB (clearance -1 same_net (type wire_wire))
rule PCB (clearance -1 same_net (type wire_smd))
rule PCB (clearance -1 same_net (type wire_pin))
rule PCB (clearance -1 same_net (type wire_via))
rule PCB (clearance -1 same_net (type smd_smd))
rule PCB (clearance -1 same_net (type smd_pin))
rule PCB (clearance -1 same_net (type smd_via))
rule PCB (clearance -1 same_net (type pin_pin))
rule PCB (clearance -1 same_net (type pin_via))
rule PCB (clearance -1 same_net (type via_via))
rule PCB (clearance -1 same_net (type test_test))
rule PCB (clearance -1 same_net (type test_wire))
rule PCB (clearance -1 same_net (type test_smd))
rule PCB (clearance -1 same_net (type test_pin))
rule PCB (clearance -1 same_net (type test_via))
rule PCB (clearance 0 same_net (type area_wire))
rule PCB (clearance 0 same_net (type area_smd))
rule PCB (clearance 0 same_net (type area_area))
rule PCB (clearance 0 same_net (type area_pin))
rule PCB (clearance 0 same_net (type area_via))
rule PCB (clearance 0 same_net (type area_test))

rule PCB (clearance 0.2500 same_net (type microvia_microvia))
set microvia_microvia same_net off
rule PCB (clearance 0.2500 same_net (type microvia_thrupin))
set microvia_thrupin same_net off
rule PCB (clearance 0.2500 same_net (type microvia_smdpin))
set microvia_smdpin same_net off
rule PCB (clearance 0.2500 same_net (type microvia_thruvia))
set microvia_thruvia same_net off
rule PCB (clearance 0.2500 same_net (type microvia_bbvia))
set microvia_bbvia same_net off
rule PCB (clearance 0.2500 same_net (type microvia_wire))
set microvia_wire same_net off
rule PCB (clearance 0.2500 same_net (type microvia_testpin))
set microvia_testpin same_net off
rule PCB (clearance 0.2500 same_net (type microvia_testvia))
set microvia_testvia same_net off
rule PCB (clearance 0.2500 same_net (type microvia_bondpad))
set microvia_bondpad same_net off
rule PCB (clearance 0.3500 same_net (type microvia_area))
set microvia_area same_net off
rule PCB (clearance 0.1900 same_net (type nhole_pin))
set nhole_pin same_net off
rule PCB (clearance 0.2500 same_net (type nhole_via))
set nhole_via same_net off
rule PCB (clearance 0.2000 same_net (type nhole_wire))
set nhole_wire same_net off
rule PCB (clearance 0.3500 same_net (type nhole_area))
set nhole_area same_net off
rule PCB (clearance 0.1900 same_net (type nhole_nhole))
set nhole_nhole same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_bbvia))
set bbvia_bbvia same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_thrupin))
set bbvia_thrupin same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_smdpin))
set bbvia_smdpin same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_thruvia))
set bbvia_thruvia same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_wire))
set bbvia_wire same_net off
rule PCB (clearance 0.3500 same_net (type bbvia_area))
set bbvia_area same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_testpin))
set bbvia_testpin same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_testvia))
set bbvia_testvia same_net off
rule PCB (clearance 0.2500 same_net (type bbvia_bondpad))
set bbvia_bondpad same_net off

################################################################################
# rule assignments for class clearances                                        #
################################################################################

################################################################################
# rule assignments for class layer clearances                                  #
################################################################################

################################################################################
# rule assignments for net clearances                                          #
################################################################################
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_microvia))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_thrupin))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_smdpin))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_thruvia))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_bbvia))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_wire))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_testpin))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_testvia))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_bondpad))
rule net VCC_3V3 (clearance 0.3000 same_net (type microvia_area))
rule net VCC_3V3 (clearance 0.3000 same_net (type nhole_pin))
rule net VCC_3V3 (clearance 0.3000 same_net (type nhole_via))
rule net VCC_3V3 (clearance 0.3000 same_net (type nhole_wire))
rule net VCC_3V3 (clearance 0.3000 same_net (type nhole_area))
rule net VCC_3V3 (clearance 0.3000 same_net (type nhole_nhole))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_bbvia))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_thrupin))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_smdpin))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_thruvia))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_wire))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_area))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_testpin))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_testvia))
rule net VCC_3V3 (clearance 0.3000 same_net (type bbvia_bondpad))

################################################################################
# WIRING RULES                                                                 #
################################################################################

################################################################################
# rule assignments for pcb wiring                                              #
################################################################################
rule pcb (tjunction on)(junction_type all)
rule pcb (staggered_via on (min_gap 0.1300))
rule pcb (stack_via any_overlap)

################################################################################
# rule assignments for layer wiring                                            #
################################################################################

################################################################################
# rule assignments for class wiring                                            #
################################################################################
rule class POWER (tjunction on)(junction_type all)
rule class POWER (staggered_via on (min_gap 0.1300))
rule class POWER (stack_via any_overlap)
circuit class POWER (use_via 300C600VIA )

################################################################################
# rule assignments for net wiring                                              #
################################################################################
################################################################################
# VIA_AT_SMD RULES                                                            #
################################################################################
rule pcb (via_at_smd off)
rule PCB (turn_under_pad off)

################################################################################
# PROPERTIES                                                                   #
################################################################################

################################################################################
# TIMING RULES                                                                 #
################################################################################

################################################################################
# rule assignments for class timing                                            #
################################################################################

################################################################################
# rule assignments for class layer timing                                      #
################################################################################

################################################################################
# rule assignments for layer timing                                            #
################################################################################
rule layer TOP (restricted_layer_length_factor 1)
rule layer BOTTOM (restricted_layer_length_factor 1)

################################################################################
# Shielding RULES                                                              #
################################################################################

################################################################################
# NOISE RULES                                                                  #
################################################################################

################################################################################
# rule assignments for class layer noise                                       #
################################################################################

################################################################################
# rule assignments for class noise                                             #
################################################################################

################################################################################
# rule assignments for net noise                                               #
################################################################################

################################################################################
# XTALK RULES                                                                  #
################################################################################

################################################################################
# rule assignments for net xtalk                                               #
################################################################################

################################################################################
# Diff Pair RULES                                                              #
################################################################################

################################################################################
# rule assignments for class diff pair                                         #
################################################################################

################################################################################
# rule assignments for group diff pair                                         #
################################################################################

# end of do file