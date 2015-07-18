describe "Quorum grammar", ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage("language-quorum")

    runs ->
      grammar = atom.grammars.grammarForScopeName("source.quorum")

  it "parses the grammar", ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe "source.quorum"

  describe "strings", ->
    it "tokenizes single-line strings", ->
      delimsByScope =
        "string.quoted.double.quorum": '"'

      for scope, delim of delimsByScope
        {tokens} = grammar.tokenizeLine(delim + "x" + delim)
        expect(tokens[0].value).toEqual delim
        expect(tokens[0].scopes).toEqual ["source.quorum", scope, "punctuation.definition.string.begin.quorum"]
        expect(tokens[1].value).toEqual "x"
        expect(tokens[1].scopes).toEqual ["source.quorum", scope]
        expect(tokens[2].value).toEqual delim
        expect(tokens[2].scopes).toEqual ["source.quorum", scope, "punctuation.definition.string.end.quorum"]
