function install_bundle {
	bundle install --system --without production
}

function build_local {
	install_bundle && \
	migrate && \
	RAILS_ENV=test rake test && \
	RAILS_ENV=test rspec && \
	RAILS_ENV=test bundle exec cucumber
}

function ut {
	migrate && \
	RAILS_ENV=test rake test && \
	RAILS_ENV=test rake db:seed && \
	RAILS_ENV=test rspec && \
	RAILS_ENV=test bundle exec cucumber
}

function migrate {
	RAILS_ENV=test rake db:drop db:create db:migrate db:seed
}

function server {
	RAILS_ENV=test rake db:drop db:create db:migrate db:seed && \
	RAILS_ENV=test rails s
}


function usage {
	printf "
options:
       h: Display this
       m: Migrate Database
      ut: Run Unit Test only
       s: Start Server
       *: Run local build script

"
}

function main {
  	case $1 in
		h) usage ;;
		ut) ut ;;
		m) migrate ;;
		s) server ;;
		*) build_local ;;
	esac
}

main $@