##########################################################################
#
# EasyList List generator
# Version 1.8
#
# Version 1.8 does not import IP addresses from the Easylist / Fanboy.
#

echo "\n----------------------------\n- EasyList List Generator\n----------------------------"
echo "Version 1.8\n"

##########################################################################
#
# Download EasyList Lists
#
# EasyList - https://easylist.to/
# Fanboy - https://fanboy.co.nz/filters.html - EasyList unofficial mirrow
#


echo "Adding EasyList Lists\n"

curl -s -L https://fanboy.co.nz/fanboy-problematic-sites.txt https://fanboy.co.nz/r/fanboy-complete.txt https://fanboy.co.nz/r/fanboy-ultimate.txt https://fanboy.co.nz/enhancedstats.txt https://fanboy.co.nz/fanboy-antifacebook.txt https://fanboy.co.nz/fanboy-antifonts.txt https://secure.fanboy.co.nz/malwaredomains_full.txt https://secure.fanboy.co.nz/easylist.txt https://secure.fanboy.co.nz/easyprivacy.txt https://easylist.to/easylistgermany/easylistgermany.txt https://easylist-downloads.adblockplus.org/easylistitaly.txt https://easylist-downloads.adblockplus.org/easylistdutch.txt https://easylist-downloads.adblockplus.org/liste_fr.txt https://easylist-downloads.adblockplus.org/easylistchina.txt http://stanev.org/abp/adblock_bg.txt https://raw.githubusercontent.com/heradhis/indonesianadblockrules/master/subscriptions/abpindo.txt https://easylist-downloads.adblockplus.org/Liste_AR.txt https://raw.githubusercontent.com/tomasko126/easylistczechandslovak/master/filters.txt https://notabug.org/latvian-list/adblock-latvian/raw/master/lists/latvian-list.txt https://raw.githubusercontent.com/easylist/EasyListHebrew/master/EasyListHebrew.txt http://margevicius.lt/easylistlithuania.txt https://easylist-downloads.adblockplus.org/antiadblockfilters.txt https://easylist-downloads.adblockplus.org/easyprivacy.tpl https://easylist-downloads.adblockplus.org/easyprivacy_nointernational.txt https://easylist-downloads.adblockplus.org/easylist_noelemhide.txt https://easylist-downloads.adblockplus.org/easylist_noadult.txt > adblock.unsorted

# Look for: ||domain.tld^

echo "- Editing list... "

sort -u adblock.unsorted | grep ^\|\|.*\^$ | grep -v \/ | grep -v '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' > adblock.sorted

# Remove extra chars and save list

echo "- Removing unwanted chars... "

sed 's/[\|^]//g;s/:.*//;/*/d' < adblock.sorted > CleanEasyLists.txt

# Remove shadow files

echo "- Removing shadow files... \n"

rm adblock.unsorted adblock.sorted


# End Message

echo "----------------------------\n- Finish\n----------------------------\n"

