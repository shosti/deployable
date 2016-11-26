use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"*ddupX)@EG0OFAOuL>?(lk-*@`uq5c1h*EmM(fLRUj/|*~iond&i)N$ZeqZjz>{R"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set vm_args: "rel/vm.args"
  set cookie: :"*ddupX)@EG0OFAOuL>?(lk-*@`uq5c1h*EmM(fLRUj/|*~iond&i)N$ZeqZjz>{R"
  set overlays: [
    {:template, "aws/appspec.yml.eex", "appspec.yml"},
    {:mkdir, "script"},
    {:copy, "script/start", "script/start"},
    {:copy, "script/stop", "script/stop"},
    {:copy, "script/validate", "script/validate"},
    {:copy, "script/after_install", "script/after_install"}
  ]
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :deployable do
  set version: current_version(:deployable)
end
