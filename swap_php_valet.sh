
function phpswap()
{
	if [ $# -eq 0 ]; then
        echo "You have to provide the package name"
        return
    fi

    newBundle="php$1" # TODO: check the bundle provided exists

    OLDIFS=$IFS
	IFS=$'\n'

    services=($(brew services list | grep php | grep started))

    IFS=$OLDIFS

    for service in "${services[@]}"
	do
		columns=($service)
		
		bundle=${columns[0]}
		user=${columns[2]}

		if [ "$bundle" = "$newBundle" ]; then
			continue;
		fi

		currentUser=$(whoami)

		if [ "$user" = "$currentUser" ]; then
			brew services stop $bundle
			if [ $? -ne 0 ]; then
				sudo brew services stop $bundle
			fi 
			
		elif [ "$user" = "root" ]; then
			sudo brew services stop $bundle
			if [ $? -ne 0 ]; then
				brew services stop $bundle
			fi 
		fi

		brew unlink $bundle
	done
	
	brew link $newBundle
	valet install
}