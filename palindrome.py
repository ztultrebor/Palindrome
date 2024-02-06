
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
    assert longest_palindrome("i am ma i") == (0,9)
    assert longest_palindrome("") == (0,0)
    assert longest_palindrome("stufs") == (0,1)
    assert longest_palindrome("maybe a man a p lan a c a nal p a nam a, or something") == (6,39)
    print("tests pass")
tests()


# ========================
# action!
