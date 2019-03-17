# Download the current trending search terms in xml format.
mkdir data
curl https://trends.google.com/trends/hottrends/atom/feed\?pn\=p1 > data/trends.xml

# Parse the titles from the xml data.
xpath data/trends.xml 'rss/channel/item/title/text()' &> data/parsed_trends.txt

# Clean up data
sed -i -e 's/--\ NODE\ --//g' data/parsed_trends.txt
sed '1,2d' data/parsed_trends.txt > data/trends.txt
rm data/parsed_trends.txt data/parsed_trends.txt-e
