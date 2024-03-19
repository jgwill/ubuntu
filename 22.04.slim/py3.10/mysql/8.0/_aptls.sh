apt list libgcc-*| tr "/" " " | awk '// {print $2}'
