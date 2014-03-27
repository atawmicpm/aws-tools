#!/usr/bin/env ruby

NAME  = ARGV[0]
IP    = ARGV[1]
FQDN  = ARGV[2]

counter = 60

puts "Waiting for #{FQDN} to come online..."
 
until system "knife winrm #{FQDN} -m -x Administrator -P 'cqU(FDe.yMN' -p 8888 'echo host up'"
	sleep 5
	exit 1 if counter == 0
	counter-=1
end

system "knife winrm #{FQDN} -m -x Administrator -P 'cqU(FDe.yMN' -p 8888 \"wmic computersystem where name='%COMPUTERNAME%' call rename name='#{NAME}'\""

system "knife winrm #{FQDN} -m -x Administrator -P 'cqU(FDe.yMN' -p 8888 \"echo #{IP} #{FQDN} >> %SYSTEMDRIVE%\\Windows\\System32\\drivers\\etc\\hosts\""

system "knife winrm #{FQDN} -m -x Administrator -P 'cqU(FDe.yMN' -p 8888 \"reg add HKLM\\System\\currentcontrolset\\services\\tcpip\\parameters /v 'NV Domain' /d 'gentn.com' /f\""

system "knife winrm #{FQDN} -m -x Administrator -P 'cqU(FDe.yMN' -p 8888 \"reg add HKLM\\System\\currentcontrolset\\services\\tcpip\\parameters /v 'Domain' /d 'gentn.com' /f\""

system "knife winrm #{FQDN} -m -x Administrator -P 'cqU(FDe.yMN' -p 8888 \"shutdown /r /t 0\""


system "sleep 60"

counter=60

puts "Waiting for #{FQDN} to come online..."



until system "knife winrm #{FQDN} -m -x Administrator -P 'cqU(FDe.yMN' -p 8888 'echo up'"
        sleep 5
        exit 1 if counter == 0
        counter-=1
end
