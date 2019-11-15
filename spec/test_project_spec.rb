require_relative "../bin/run.rb"
# require_relative "../bin/cli.rb"
describe "CLI" do

  let (:test) {CLI.new}

  # it "puts a welcome message" do
  #   expect(test.run_program).to puts("Welcome to:")
  # end

  it "return true if username Jose exists" do
    expect(test.username_exists("Jose")).to be("Jose")
  end

  it "return true if username "" exists" do
    expect(test.username_exists("Juan")).to be(nil)
  end
end
