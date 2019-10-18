# This problem was asked by Spotify.

# You have access to ranked lists of songs for various users. Each song is represented as an integer, and more preferred songs appear earlier in each list. For example, the list [4, 1, 7] indicates that a user likes song 4 the best, followed by songs 1 and 7.

# Given a set of these ranked lists, interleave them to create a playlist that satisfies everyone's priorities.

# For example, suppose your input is [[1, 7, 3], [2, 1, 6, 7, 9], [3, 9, 5]]. In this case a satisfactory playlist could be [2, 1, 6, 7, 3, 9, 5].

# How large will the input be, 10 people, 1000 people?

# We want to play every song at least once
# We want to give a priority to each song depening how many times it is brought up
# We want to give a priority to the index in the playlist
# We want to give a priorty to how many songs are in the list - more equals higher priooity for user, becuase they are a greater consumer


# Get every song based on uniqness
# Get the length of the array, the index the number is at, and the actual value

# length is to dertmine how much the user uses the app
# index is how much they like the song
# the actual song

# Loop through each save in hash
# song => { 
#     song_priority => 2,
#     user_priority => 8
# }

# 1 => {
#     song_priority => 1,
#     user_priority => 3,
#     rank => 0.333
# }

# { 1: 0.132, 2: 0.2 }


# What do we do with the values. Devide / Multiply? Lower better, Higher Better?
# Divide! Lower beeter! 1.0 / 3
# Multiply rank if song shows up again, lower is better


def priority_list many_users_playlist
    songs = {}
    many_users_playlist.each do |playlist|
        playlist.each_with_index do |song,  index|
            song_priority = index + 1
            user_priority = playlist.length
            rank = song_priority.to_f / user_priority
            if songs[song]
                songs[song] = songs[song] * rank
            else
                songs[song] = rank
            end
        end
    end
    songs.sort_by{|k, v| v }.to_h.keys
end

priority_list [[1, 7, 3], [2, 1, 6, 7, 9], [3, 9, 5]] # => output: [1, 2, 3, 7, 6, 9, 5]