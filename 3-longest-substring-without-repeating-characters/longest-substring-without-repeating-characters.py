class Solution(object):
    def lengthOfLongestSubstring(self, s):
        """
        :type s: str
        :rtype: int
        """
        
        max_length = 0
        start = 0
        char_map = {}

        for i, ch in enumerate(s):
             if ch in char_map and char_map[ch] >= start:
                 start = char_map[ch] + 1  # Move start past repeated character

             char_map[ch] = i  # Update last seen index
             max_length = max(max_length, i - start + 1)  # Update max length

        return max_length
        