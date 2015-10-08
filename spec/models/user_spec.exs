defmodule PhoenixPractice.UserSpec do
  use ESpec.Phoenix, model: PhoenixPractice.User

  alias PhoenixPractice.User

  let :valid_attrs, do: %{name: "yhoshino11"}
  let :invalid_attrs, do: %{}

  context "valid changeset" do
    subject do: User.changeset(%User{}, valid_attrs)
    it do: should be_valid
  end

  context "expectation" do
    it "is ok" do
      changeset = User.changeset(%User{}, valid_attrs)
      expect(changeset).to be_valid
    end

    it "requires name" do
      changeset = User.changeset(%User{}, invalid_attrs)
      expect(changeset).to have_errors(:name)
      expect(changeset).to have_errors(name: "can't be blank")
    end
  end
end
