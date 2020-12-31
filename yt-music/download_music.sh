#!/bin/bash


# /output -- downloaded music stored here
# /config/music.log -- log file
# /config/downloaded.txt -- archive file

# check if env variable exists
if [[ -z "/config/downloaded.txt" ]]; then
    echo "Cannot find /config/downloaded.txt"
    exit 1
fi
if [[ -z "/output" ]]; then
    echo "Please create /output and bind to it"
    exit 1
fi

yt_channels=(
    https://www.youtube.com/user/Aviencloud                  # aviencloud
    https://www.youtube.com/channel/UCM9KEEuzacwVlkt9JfJad7g # chill nation
    https://www.youtube.com/channel/UCSa8IUd1uEjlREMa21I3ZPQ # cloudkid
    https://www.youtube.com/channel/UCqolymr8zonJzC08v2wXNrQ # kyra
    https://www.youtube.com/channel/UC5nc_ZtjKW1htCVZVRxlQAQ # mrsuecidesheep
    https://www.youtube.com/channel/UCe55Gy-hFDvLZp8C8BZhBnw # nightblue music
    https://www.youtube.com/channel/UC65afEgL62PGFWXY7n6CUbA # trapcity
    https://www.youtube.com/channel/UCa10nxShhzNrCE1o2ZOPztg # trap nation
    https://www.youtube.com/channel/UCCpSl61ps2vc85lMCxeHaSw # vibes zero
    https://www.youtube.com/channel/UCMOgdURr7d8pOVlc-alkfRg # xkito
    https://www.youtube.com/user/LithuaniaHQ                 # lithuania
    https://www.youtube.com/channel/UCZweNIYbpezrrQv9pEtmLRg # vibes 9
    https://www.youtube.com/channel/UC9mFio7rXEgtRQAhoIeGAew # syros
    https://www.youtube.com/channel/UCJ6td3C9QlPO9O_J5dF4ZzA # monster cat
    https://www.youtube.com/user/EpicNetworkMusic            # ENM
    https://www.youtube.com/channel/UC9uLMAmdGQaeLPHAOqkYlrw # AnimeVibe (like syros)
    https://www.youtube.com/user/DiavelNN                    # Diversity
)

   
# save logs
echo "Date: $(date +%F)">>/config/music.log 

# start downloading
for i in "${yt_channels[@]}"; do
    youtube-dl --add-metadata \
    --metadata-from-title "%(artist)s - %(title)s" \
    --embed-thumbnail \
    --download-archive /config/downloaded.txt \
    --no-post-overwrites \
    --dateafter 20190101 \
    -ciwx \
    --audio-format mp3 \
    -o /output/"%(title)s.%(ext)s" "$i" \
    &>/dev/null; 
done


# clean up
rm -r /output/*.webp /output/*.jpg /output/*.webm
echo "Success">>/config/music.log 
