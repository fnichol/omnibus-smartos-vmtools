name "mdata-client"
version "20131212"

source :url => "https://github.com/joyent/mdata-client/archive/20131212.tar.gz",
       :md5 => "acfe4e2779eaa47e0ce16629f82d81cd"

relative_path "mdata-client-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "ln -snf #{install_dir}/embedded proto", :env => env
  command "make", :env => env
  command "make install", :env => env
  command "rm -rf #{install_dir}/embedded/bin", :env => env
  command "rm -rf #{install_dir}/embedded/lib", :env => env
  %w(mdata-delete  mdata-get  mdata-list  mdata-put).each do |bin|
    command "ln -snf ../embedded//usr/sbin/#{bin}", :cwd => "#{install_dir}/bin"
  end
end
