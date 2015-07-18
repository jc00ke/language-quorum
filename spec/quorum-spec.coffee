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
