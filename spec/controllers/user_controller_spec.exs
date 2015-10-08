defmodule PhoenixPractice.UserControllerSpec do
  use ESpec.Phoenix, controller: PhoenixPractice.UserController
  alias PhoenixPractice.User

  context "Response" do
    it "index" do
      Repo.insert(%User{id: 1, name: "yhoshino11"})
      user = Repo.get!(User, 1)
      res_conn = action(:index, %{})
      expect(res_conn).to be_successful
      expect(res_conn).to have_in_assigns(users: [user])
      expect(res_conn).to render_template("index.html")
    end

    it "show" do
      Repo.insert(%User{id: 1, name: "yhoshino11"})
      user = Repo.get!(User, 1)
      res_conn = action(:show, %{"id" => 1})
      expect(res_conn).to be_successful
      expect(res_conn).to have_in_assigns(user: user)
      expect(res_conn).to render_template("show.html")
    end

    it "new" do
      changeset = User.changeset(%User{})
      res_conn = action(:new, %{})
      expect(res_conn).to be_successful
      expect(res_conn).to have_in_assigns(changeset: changeset)
      expect(res_conn).to render_template("new.html")
    end

    it "create" do
      res_conn = action(:create, %{"user" => %{name: "yhoshino11"}})
      expect(res_conn).to redirect_to(user_path(conn, :index))
      expect(Repo.all(User) |> Enum.count).to eq(1)
    end

    it "create - invalid" do
      res_conn = action(:create, %{"user" => %{}})
      expect(res_conn).to be_successful
      expect(res_conn).to render_template("new.html")
      expect(Repo.all(User) |> Enum.count).to eq(0)
    end

    it "edit" do
      Repo.insert(%User{id: 1, name: "yhoshino11"})
      user = Repo.get!(User, 1)
      res_conn = action(:edit, %{"id" => 1})
      expect(res_conn).to be_successful
      expect(res_conn).to render_template("edit.html")
      expect(res_conn).to have_in_assigns(user: user, changeset: User.changeset(user))
    end

    it "update" do
      Repo.insert(%User{id: 1, name: "yhoshino11"})
      user = Repo.get!(User, 1)
      res_conn = action(:update, %{"id" => 1, "user" => %{name: "yhoshino12"}})
      expect(res_conn).to redirect_to(user_path(conn, :show, user))
      expect(Repo.get!(User, 1) |> Map.fetch(:name)).to eq({:ok, "yhoshino12"})
    end
  end
end
