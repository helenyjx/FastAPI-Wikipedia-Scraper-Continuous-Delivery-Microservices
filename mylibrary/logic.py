import wikipedia
from textblob import TextBlob


def wiki(name="Duke University", length=3):
    """This is a wikipedia fetcher"""

    my_wiki = wikipedia.summary(name, length)
    return my_wiki


def search_wiki(name):
    """Search for famous names at wikipedia"""

    results = wikipedia.search(name)
    return results


def phrase(name):
    """Returns phrases from wikipedia"""

    page = wiki(name)
    blob = TextBlob(page)
    return blob.noun_phrases
