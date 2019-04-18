# A 3-node example for ad-hoc simulation with AODV 

# Define options 

set val(chan) 		Channel/WirelessChannel 	;# Channel Type
set val(prop) 		Propagation/TwoRayGround 	;# propogation model
set val(netif) 		Phy/WirelessPhy 		;# network interface type
set val(mac) 		Mac/802_11 			;# Mac type
set val(ifq) 		Queue/DropTail/PriQueue 	;# interface queue type
set val(ll) 		LL 				;#link layer type
set val(ant) 		Antenna/OmniAntenna 		;# antenna model
set val(ifqlen) 	50 				;# max packet in queue
set val(nn) 		11				;# number of mobile nodes
set val(rp)             AODV 				;# routing protocol
set val(x) 		1000 				;# x dimension of topography
set val(y) 		1000 				;# y dimension of topography
set val(stop) 		35.0				;# time of the simulation end

set ns [new Simulator] 

set tracefd [open malicious.tr w] 

#set windowVsTime2 [open win.tr w] 

set namtrace [open simwrls.nam w] 

$ns trace-all $tracefd 

$ns namtrace-all-wireless $namtrace $val(x) $val(y) 

# set up topography object 

set topo [new Topography] 

$topo load_flatgrid $val(x) $val(y) 

create-god $val(nn) 

# 

# Create nn mobilenodes [$val(nn)] and attach them to the channel. 

# 
set chan_1_ [new $val(chan)]

# configure the nodes 

$ns node-config -adhocRouting $val(rp) \
		-llType $val(ll) \
		-macType $val(mac) \
		-ifqType $val(ifq) \
		-ifqLen $val(ifqlen) \
		-antType $val(ant) \
		-propType $val(prop) \
		-phyType $val(netif) \
		-channel $chan_1_ \
		-topoInstance $topo \
		-agentTrace ON \
		-routerTrace ON\
		-macTrace OFF \
		-movementTrace ON \

for {set i 0} {$i < $val(nn) } { incr i } { 

set node_($i) [$ns node] 

} 

# Provide initial location of mobilenodes 



$node_(0) set X_ 990
$node_(0) set Y_ 990

$node_(1) set X_ 480.265960458508
$node_(1) set Y_ 480.028086294849
$node_(1) set Z_ 0.000000000000
$node_(2) set X_ 333.428043488654
$node_(2) set Y_ 811.930338591689
$node_(2) set Z_ 0.000000000000
$node_(3) set X_ 417.406638809615
$node_(3) set Y_ 299.743109463380
$node_(3) set Z_ 0.000000000000
$node_(4) set X_ 450.530406184104
$node_(4) set Y_ 650.042097488594
$node_(4) set Z_ 0.000000000000
$node_(5) set X_ 550
$node_(5) set Y_ 570.139076628938
$node_(5) set Z_ 0.000000000000
$node_(6) set X_ 234.927918320756
$node_(6) set Y_ 546.533704535805
$node_(6) set Z_ 0.000000000000
$node_(7) set X_ 600.390152288869
$node_(7) set Y_ 205.373355572498
$node_(7) set Z_ 0.000000000000
$node_(8) set X_ 388.544668633791
$node_(8) set Y_ 375.976030007707
$node_(8) set Z_ 0.000000000000
$node_(9) set X_ 220.190403263924
$node_(9) set Y_ 783.946938040891
$node_(9) set Z_ 0.000000000000
$node_(10) set X_ 410.585889334293
$node_(10) set Y_ 490.507991802334
$node_(10) set Z_ 0.000000000000




#$node_(101) set X_ 995
#$node_(101) set Y_ 995
#$node_(102) set X_ 995
#$node_(102) set Y_ 995

# Generation of movements 

#$ns at 10.0 "$node_(0) setdest 250.0 250.0 3.0" 

#$ns at 15.0 "$node_(0) setdest 450.0 490.0 5.0" 

#$ns at 15.0 "$node_(1) setdest 250.0 10.0 5.0" 

#$ns at 110.0 "$node_(0) setdest 480.0 300.0 5.0" 

# Set a TCP connection between node_(0) and node_(1) 




 



$ns at 0.0 "[$node_(4) set ragent_] startinit"
#$ns at 0.5 "[$node_(4) set ragent_] startft"
#$ns at 12.0 "[$node_(4) set ragent_] startst"
#$ns at 5.0 "[$node_(1) set ragent_] startlcd"
#$ns at 5.0 "[$node_(1) set ragent_] startlcd"
$ns at 10.0 "[$node_(1) set ragent_] startfd"
$ns at 10.0 "[$node_(2) set ragent_] startfd"
$ns at 10.0 "[$node_(3) set ragent_] startfd"
$ns at 10.0 "[$node_(4) set ragent_] startfd"
$ns at 10.0 "[$node_(5) set ragent_] startfd"
$ns at 10.0 "[$node_(6) set ragent_] startfd"
$ns at 10.0 "[$node_(7) set ragent_] startfd"
$ns at 10.0 "[$node_(8) set ragent_] startfd"
$ns at 10.0 "[$node_(9) set ragent_] startfd"
$ns at 10.0 "[$node_(10) set ragent_] startfd"

$ns at 1.0 "[$node_(1) set ragent_] startlife"
$ns at 1.0 "[$node_(2) set ragent_] startlife"
$ns at 1.0 "[$node_(3) set ragent_] startlife"
$ns at 1.0 "[$node_(4) set ragent_] startlife"
$ns at 1.0 "[$node_(5) set ragent_] startlife"
$ns at 1.0 "[$node_(6) set ragent_] startlife"
$ns at 1.0 "[$node_(7) set ragent_] startlife"
$ns at 1.0 "[$node_(8) set ragent_] startlife"
$ns at 1.0 "[$node_(9) set ragent_] startlife"
$ns at 1.0 "[$node_(10) set ragent_] startlife"
$ns at 2.0 "[$node_(1) set ragent_] startlife"
$ns at 2.0 "[$node_(2) set ragent_] startlife"
$ns at 2.0 "[$node_(3) set ragent_] startlife"
$ns at 2.0 "[$node_(4) set ragent_] startlife"
$ns at 2.0 "[$node_(5) set ragent_] startlife"
$ns at 2.0 "[$node_(6) set ragent_] startlife"
$ns at 2.0 "[$node_(7) set ragent_] startlife"
$ns at 2.0 "[$node_(8) set ragent_] startlife"
$ns at 2.0 "[$node_(9) set ragent_] startlife"
$ns at 2.0 "[$node_(10) set ragent_] startlife"
$ns at 3.0 "[$node_(1) set ragent_] startlife"
$ns at 3.0 "[$node_(2) set ragent_] startlife"
$ns at 3.0 "[$node_(3) set ragent_] startlife"
$ns at 3.0 "[$node_(4) set ragent_] startlife"
$ns at 3.0 "[$node_(5) set ragent_] startlife"
$ns at 3.0 "[$node_(6) set ragent_] startlife"
$ns at 3.0 "[$node_(7) set ragent_] startlife"
$ns at 3.0 "[$node_(8) set ragent_] startlife"
$ns at 3.0 "[$node_(9) set ragent_] startlife"
$ns at 3.0 "[$node_(10) set ragent_] startlife"

#$ns at 10.0 "[$node_(1) set ragent_] startlcd"
#$ns at 10.0 "[$node_(2) set ragent_] startlcd"
#$ns at 10.0 "[$node_(3) set ragent_] startlcd"
#$ns at 10.0 "[$node_(4) set ragent_] startlcd"
#$ns at 10.0 "[$node_(5) set ragent_] startlcd"
#$ns at 10.0 "[$node_(6) set ragent_] startlcd"
#$ns at 10.0 "[$node_(7) set ragent_] startlcd"
#$ns at 10.0 "[$node_(8) set ragent_] startlcd"
#$ns at 10.0 "[$node_(9) set ragent_] startlcd"
#$ns at 10.0 "[$node_(10) set ragent_] startlcd"


# Printing the window size 

#proc plotWindow {tcpSource file} { 

#global ns 

#set time 0.01 

#set now [$ns now] 

#set cwnd [$tcpSource set cwnd_] 

#puts $file "$now $cwnd" 

#$ns at [expr $now+$time] "plotWindow $tcpSource $file" } 

#$ns at 10.1 "plotWindow $tcp $windowVsTime2" 

# Define node initial position in nam 

for {set i 0} {$i < $val(nn)} { incr i } { 

# 30 defines the node size for nam 

$ns initial_node_pos $node_($i) 40 

} 

$ns at 0.0 "[$node_(2) set ragent_] fault"
#$ns at 0.0 "[$node_(4) set ragent_] fault"
#$ns at 0.0 "[$node_(3) set ragent_] fault"

# Telling nodes when the simulation ends 

for {set i 0} {$i < $val(nn) } { incr i } { 

$ns at $val(stop) "$node_($i) reset"; 

} 

# ending nam and the simulation 

$ns at $val(stop) "$ns nam-end-wireless $val(stop)" 

$ns at $val(stop) "stop" 

$ns at 150.01 "puts \"end simulation\" ; $ns halt" 

proc stop {} { 

global ns tracefd namtrace 

$ns flush-trace 

close $tracefd 

close $namtrace 

exec nam simwrls.nam &

} 

$ns run
