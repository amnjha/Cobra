
echo "                          ____ ___  ____  ____      _  "  
echo "                         / ___/ _ \| __ )|  _ \    / \ "  
echo "                        | |  | | | |  _ \| |_) |  / _ \  "
echo "                        | |__| |_| | |_) |  _ <  / ___ \ "
echo "                         \____\___/|____/|_| \_\/_/   \_\ "
echo "                       Made with <3 and sweat by ManasH4rsh   "
echo " 								"
echo ""
echo "checking your system and setting up the environment: "
echo ""
sudo apt install golang;
sudo apt install python3;
sudo apt install python3-pip;
sudo apt install git;
echo "installing your assets, please wait:)"
echo ""

git clone https://github.com/GerbenJavado/LinkFinder;
git clone https://github.com/s0md3v/Arjun; 
git clone https://github.com/m4ll0k/SecretFinder;
git clone https://github.com/devanshbatham/ParamSpider;
go get github.com/hakluke/hakrawler;
GO111MODULE=on go get -u -v github.com/hahwul/dalfox;
go get github.com/tomnomnom/hacks/waybackurls;
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder;
GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
git clone https://github.com/projectdiscovery/nuclei-templates;
go get github.com/haccer/subjack;
git clone https://github.com/findomain/findomain.git;
GO111MODULE=on go get -u -v github.com/lc/gau;
GO111MODULE=on go get -u -v github.com/hahwul/dalfox;
go get -v github.com/OWASP/Amass/v3/...;
git clone https://github.com/maurosoria/dirsearch
git clone https://github.com/s0md3v/Corsy.git;
go get -u github.com/ffuf/ffuf;
GO111MODULE=on go get -v github.com/projectdiscovery/naabu/v2/cmd/naabu;
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx;
git clone https://github.com/hisxo/gitGraber.git;
git clone https://github.com/lobuhi/byp4xx.git;

echo	" 1.  subfinder		2. dnsx				3.  nuclei		"	
echo	" 4.  httpx       	5. waybackurls            	6.  getallurls					"
echo	" 7.  naabu   		8. aquatone               	9.  hakrawler						"
echo	" 10. FFUF	 	11. dirsearch			12. amass "
echo	" 13. dalfox		14. findomain			15. arjun"
echo	" 16. LinkFinder		17. secretfinder		18. ParamSpider"
echo	" 19. Corsy 		20. gitgraber 			21. byp4xx"
echo    " 22. Subjack"
echo -n "Enter the respective number from tool list that you want to use: "
read number
echo ""

case $number in
	1)
		echo -n "Enter the domain: "
		read domain
             	subfinder -d $domain -o output.txt
		;;

	2)
		echo -n "Enter the domain: "
		read domain
             	subfinder -d $domain | dnsx -cname -resp
		;;
          
	3)
		echo -n "Enter the domain: "
		read domain
             	echo "$domain" | nuclei -t nuclei-templates -o $domain.txt
		;;
	
	4)
		echo -n "Enter the domain: "
		read domain
  	subfinder -d $domain | httpx -silent
		;;

	5)
		echo -n "Enter the domain: "
		read domain
             	echo "$domain" | waybackurls > $domain.txt
		;;

	6)
		echo -n "Enter the domain: "
		read domain
             	gau -o $domain.txt $domain
		;;

	7)
		echo -n "Enter the domain: "
		read domain
             	naabu -host $domain
		;;

	8)
		echo -n "Enter the domain: "
		read domain
             	echo "$domain" | aquatone
		;;

	9)
		echo -n "Enter the domain: "
		read domain
              	hakrawler -url $domain -depth 1
		;;

	10)
		echo -n "Enter the domain: "
		read domain
             	ffuf -w /usr/share/wordlists/rockyou.txt -u https://$domain/FUZZ
		;;
	11)
		echo -n "Enter the domain: "
		read domain
		python3 ~/dirsearch/dirsearch.py -u $domain -e all
		;;
	
	12)
		echo -n "Enter the domain: "
		read domain
		amass intel -d $domain -whois -o output.txt
		;;

	13)
		echo -n "Enter the domain: "
		read domain
		dalfox url http://$domain -b hahwul.xss.ht
		;;

	14)
		echo -n "Enter the domain: "
		read domain
		findomain -t $domain -o
		;;

	15)
		echo -n "Enter the domain: "
		read domain
		arjun -u https://$domain
		;;


	16)
		echo -n "Enter the domain: "
		read domain
		python3 ~/LinkFInder/linkfinder.py -i https://$domain -d 
		;;

	17)
		echo -n "Enter the domain: "
		read domain
		python3 ~/secretfinder/SecretFinder.py -i $domain -o output.html
		;;

	18)
		echo -n "Enter the domain: "
		read domain
		python3 ~/ParamSpider/paramspider.py --domain $domain
		;;

	19)
		echo -n "Enter the domain: "
		read domain
		python3 ~/Corsy/corsy.py -u https://$domain
		;;

	
	20)
		echo -n "Enter the domain: "
		read domain
		python3 ~/gitGraber/gitGraber.py -k keywordsfile.txt \"$domain\" -s
		;;

	21)
		echo -n "Enter the URL: "
		read  url
		~/byp4xx/./byp4xx.sh $url
		;;

    22) 
        echo -n "Enter your file: "
		read  file
		./subjack -w $file -t 100 -timeout 30 -o results.txt -ssl
		;;


	*)	
		echo "Please give valid choice!!!"
		;;

esac
