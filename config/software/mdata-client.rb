name "mdata-client"
version "20131212"

source :url => "https://github.com/joyent/mdata-client/archive/20131212.tar.gz",
       :md5 => "acfe4e2779eaa47e0ce16629f82d81cd"

relative_path "mdata-client-#{version}"

embedded = "#{install_dir}/embedded"

build_env = {
  "LDFLAGS" => "-L/lib -I#{embedded}/include",
  "CFLAGS" => "-L#{embedded}/lib -I#{embedded}/include",
  "LD_RUN_PATH" => "#{embedded}/lib"
}

build do
  command "ln -snf #{embedded} proto"
  command "make", :env => build_env
  command "make install", :env => build_env
  command "rm -rf #{embedded}/lib/smartdc/mdata-get"
  command "ln -snf #{embedded}/usr/sbin/mdata-get #{embedded}/lib/smartdc/"

  %w(mdata-delete  mdata-get  mdata-list  mdata-put).each do |bin|
    command "ln -snf ../embedded//usr/sbin/#{bin}", :cwd => "#{install_dir}/bin"
  end
end
