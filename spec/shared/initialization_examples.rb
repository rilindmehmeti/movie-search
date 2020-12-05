shared_examples "with initialization errors" do
  it "throws ArgumentError" do
    expect { subject }.to raise_error(ArgumentError)
  end
end

shared_examples "without initialization errors" do
  it "doesn't throw error" do
    expect { subject }.not_to raise_error
  end
end
