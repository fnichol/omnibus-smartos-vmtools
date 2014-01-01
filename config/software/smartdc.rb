name "smartdc"
version "20140101"

source :path => File.expand_path("files", Omnibus.project_root)

embedded = "#{install_dir}/embedded"

dest_dir = "#{embedded}/lib/smartdc"

build do
  command "mkdir -p #{dest_dir}"
  command "cp -R #{platform}/lib/smartdc/* #{dest_dir}/", :cwd => source[:path]
  command "mkdir -p #{dest_dir}/etc"
  command "cp -R #{platform}/etc/* #{embedded}/etc/"

  if %w(debian).include?(OHAI['platform_family'])
    command "cp -R linux/lib/smartdc/* #{dest_dir}/", :cwd => source[:path]
  end
end
