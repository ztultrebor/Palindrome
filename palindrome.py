
# =====================
# functions


def longest_palindrome(text):
    revtext = ''.join(list(reversed(text)))
    L = len(text)
    indices = (0,0)
    for d in range(L+1,0,-1):
        for a in range(L+1-d):
            if text[a:a+d] == revtext[L-a-d:L-a]:
                return (a, a+d)
    return indices



# ======================
# testing


def tests():
    assert longest_palindrome("i am ma i") == "i am ma i"
    return "tests pass"
#tests()


# ========================
# action!

print(longest_palindrome("i am ma i"))
