#!/usr/bin/perl
$tracefile=$ARGV[0];
$granularity=$ARGV[1];

$ofile="simul_result_DDDSpanning.txt";
open OUT, ">$ofile" or die "$0 cannot open output file $ofile: $!";

open (DR,STDIN);
$gclock=0;

#Data Packet Information
$dataSent = 0;
$dataRecv = 0;
$dataDrop = 0;
$faultyNode = 0;

#DDD Packet Information
$INITMsgsend = 0;
$LifeResponsesend = 0;
$StMsgsend = 0;
$LocalViewsend = 0;
$GlobalViewsend = 0;

$INITMsgrecv = 0;
$LifeResponserecv = 0;
$StMsgrecv = 0;
$LocalViewrecv = 0;
$GlobalViewrecv = 0;


if ($granularity==0) {$granularity=30;}

while(<>){
	chomp;
	if (/^M/){
		if (/^M.*INITMsg/) {
			$INITMsgsend++;
		}
		if (/^M.*LifeResponse/) {
		
			$LifeResponsesend++;
		}
		if (/^M.*StMsg/) {
			$StMsgsend++;
		}
		if (/^M.*LocalView/) {
			$LocalViewsend++;			
		}		
		if (/^M.*GlobalView/) {
			$GlobalViewsend++;			
		}
	}
	elsif (/^At/){
		if (/^At.*INITMsg/) {
			$INITMsgrecv++;
		}
		if (/^At.*LifeResponse/) {
		
			$LifeResponserecv++;
		}
		if (/^At.*StMsg/) {
			$StMsgrecv++;
		}
		if (/^At.*LocalView/) {
			$LocalViewrecv++;			
		}		
		if (/^At.*GlobalView/) {
			$GlobalViewrecv++;			
		}
	}
		 
}

close DR;

$dataSent = $INITMsgsend + $LifeResponsesend + $StMsgsend + $LocalViewsend + $GlobalViewsend;
$dataRecv = $INITMsgrecv + $LifeResponserecv + $StMsgrecv + $LocalViewrecv + $GlobalViewrecv;
#$delivery_ratio = 100*($dataRecv/$dataSent);
#$datadrop = $dataSent - $dataRecv;
$INITMsgsend -= 1;

print "INITMsg send		: $INITMsgsend\n";
print "LifeResponse send	: $LifeResponsesend\n";
print "StMsg send		: $StMsgsend\n";
print "LocalView send		: $LocalViewsend\n";
print "GlobalView send		: $GlobalViewsend\n\n";

#print "INITMsg recv		: $INITMsgrecv\n";
#print "LifeResponse recv	: $LifeResponserecv\n";
#print "StMsg recv		: $StMsgrecv\n";
#print "LocalView recv		: $LocalViewrecv\n";
#print "GlobalView recv		: $GlobalViewrecv\n\n";

print "Total Messages Sent		: $dataSent \n";
#print "Messages Recieved        : $dataRecv \n";
#print "Delivery Rate		: $delivery_ratio \n";

print OUT "INITMsg send		: $INITMsgsend\n";
print OUT "LifeResponse send	: $LifeResponsesend\n";
print OUT "StMsg send		: $StMsgsend\n";
print OUT "LocalView send	: $LocalViewsend\n";
print OUT "GlobalView send	: $GlobalViewsend\n\n";

#print OUT "INITMsg recv		: $INITMsgrecv\n";
#print OUT "LifeResponse recv	: $LifeResponserecv\n";
#print OUT "StMsg recv		: $StMsgrecv\n";
#print OUT "LocalView recv	: $LocalViewrecv\n";
#print OUT "GlobalView recv	: $GlobalViewrecv\n\n";

print OUT "Total Messages Sent, $dataSent\n";
#print OUT "Messages Recieved, $dataRecv\n";
#print OUT "Messages Dropped, $dataDrop\n";
#print OUT "Delivery Rate, $delivery_ratio\n";


close OUT;

