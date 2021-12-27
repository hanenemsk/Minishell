#include <stdio.h>
#include "../../inc/minishell.h"

int	ft_echo(int argc, char **argv)
{
	int	i;

	i = 1;
	while (i < argc)
	{
		if (ft_strncmp(argv[i], "-n", 2) == 0)
			i++;
		ft_putstr_fd(argv[i], 1);
		if (i != argc - 1)
		ft_putchar_fd(' ', 1);
		if (ft_strncmp(argv[1], "-n", 2) != 0 && i == argc - 1)
		{
			ft_putchar_fd('\n', 1);
		}
		i++;
	}
	return (0);
}

/*  
int	main(int argc, char **argv)
{
	ft_echo(argc, argv);
	return (0);
}
*/
