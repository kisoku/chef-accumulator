
include_recipe "mail_alias"

mail_alias "foo" do
  recipients "msf"
end

mail_alias "foo" do
  recipients [ "msf", "miah", "spheromak" ]
end
