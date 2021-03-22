#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "libasm.h"

void mid_title()
{
	printf("\033[0;32m");
}

void fat_title()
{
	printf("\033[0;31m");
}

void reset()
{
	printf("\033[0m");
}

void test_read()
{
	ssize_t result;

	mid_title();
	printf("read from standard input\n");
	reset();
	printf("Type something (buffer = 32): \n");
	char str[33];
	result = ft_read(1, str, 32);
	if (result >= 0)
	{
		str[result] = 0;
		printf("You typed : |%s| -- %ld\n", str, result);
	}
	else
		perror("error");

	mid_title();
	printf("Write to a file then read from it\n");
	reset();
	int fd = open("ft_read.test.txt", O_CREAT | O_TRUNC | O_WRONLY, 0644);
	if (fd < 0)
		perror("error");
	result = write(fd, "Trying to read some input from file...\n", 39);
	char *str2 = malloc(result + 1);
	close(fd);

	fd = open("ft_read.test.txt", O_RDONLY);
	if (fd < 0)
		perror("error");
	result = ft_read(fd, str2, result);
	if (result >= 0)
	{
		str2[result] = 0;
		printf("The function read from file : |%s| -- %ld\n", str2, result);
	}
	else
		perror("error");
	free(str2);
	close(fd);

	mid_title();
	printf("trying to read from wrong fd :\n");
	reset();
	fd = open("ft_read.test.txt", O_WRONLY);
	if (fd < 0)
		perror("error");
	result = ft_read(fd, str2, result);
	printf("result of the function : %ld\n", result);
	perror("error");
	close(fd);
}

void test_write()
{
	ssize_t result;

	mid_title();
	printf("Writing into stdout :\n");
	printf("\033[0m\n");
	result = ft_write(1, "|Hello World!", 13);
	printf("| -- %ld\n", result);

	mid_title();
	printf("Writing into custom file, then printing the content :\n");
	reset();

	int fd = open("ft_write.test.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
	if (fd < 0)
		perror("error");
	result = ft_write(fd, "Trying to write some output into file...\n", 41);
	if (result < 0)
		perror("error");
	close(fd);
	if (result >= 0)
	{
		fd = open("ft_write.test.txt", O_RDONLY);
		char *str = malloc(result + 1);
		result = read(fd, str, result);
		str[result] = 0;
		printf("File content : |%s|\n", str);
		free(str);
		close(fd);
	}

	mid_title();
	printf("Trying to write to the wrong fd\n");
	reset();

	fd = open("ft_write.test.txt", O_RDONLY);
	if (fd < 0)
		perror("error");
	else
	{
		result = ft_write(fd, "test", 4);
		printf("result = %ld\n", result);
		perror("error");
	}
}

void unit_test_strlen(char *str)
{
	if (str != NULL)
	{
		printf("strlen on \"%s\" : %ld\n", str, strlen(str));
		printf("ft_strlen on \"%s\" : %ld\n", str, ft_strlen(str));
	}
	else
		printf("strlen segfaults with NULL\n");
}

void test_strlen()
{
	mid_title();
	printf("Testing with normal string :\n");
	reset();
	unit_test_strlen("Hello world!");

	mid_title();
	printf("Testing with big string :\n");
	reset();
	unit_test_strlen("boiuhsfoihjdsfoihjdfoidshfodihfodisjhfosdijfosaijfasoifhsofanbdlofuhnaovliuhvolzuchvzouivhjpjihapofuidshjfpoauhvlovbnlaovhnolpvuihdpodijhahzol;xvkjnhlzvjnouhapofiuhjapofijhp");

	mid_title();
	printf("Testing with empty string :\n");
	reset();
	unit_test_strlen("");

	mid_title();
	printf("Testing with NULL :\n");
	reset();
	unit_test_strlen(NULL);
}

void test_strcpy()
{
	char src[] = "Hello World!";
	char dst[13];

	mid_title();
	printf("Addresses : src = %p, dst = %p\n", src, dst);
	printf("Testing to copy src to dst :\n");
	reset();

	printf("returned (%p)\n", ft_strcpy(dst, src));
	printf("dst (%p) : |%s|\n", dst, dst);
	printf("src (%p) : |%s|\n", src, src);
}

void unit_test_strcmp(const char *s1stack, const char *s2stack)
{
	char *s1 = s1stack ? strdup(s1stack) : NULL;
	char *s2 = s2stack ? strdup(s2stack) : NULL;
	mid_title();
	printf("Testing with : \"%s\"(%p), \"%s\"(%p)\n", s1, s1, s2, s2);
	reset();

	if (s1 && s2)
	{
		printf("strcmp = %d\n", strcmp(s1, s2));
		printf("ft_strcmp = %d\n", ft_strcmp(s1, s2));
	}
	else
		printf("strcmp doesn't work with NULL");
	free(s1);
	free(s2);
}

void test_strcmp()
{
	unit_test_strcmp(
		"Hello World!",
		"Hello World!");

	unit_test_strcmp(
		"as",
		"aposafpaokf");

	unit_test_strcmp(
		"aposafpaokf",
		"as");

	unit_test_strcmp(
		"Hello World!",
		NULL);
}

void unit_test_strdup(char *s)
{
	mid_title();
	printf("strdup-ing \"%s\"(%p)\n", s, s);
	reset();
	char *strdupped = ft_strdup(s);
	printf("strdup-ed string : \"%s\"(%p)\n", strdupped, strdupped);
	free(strdupped);
}

void test_strdup()
{
	unit_test_strdup("henlo fren");
	char *str = "bonjour";
	unit_test_strdup(str);
	char str1[] = "heheheheheh";
	unit_test_strdup(str1);
}

int main()
{
	fat_title();
	printf("TESTS ABOUT READ FUNCTION\n");
	reset();
	test_read();

	printf("\n-----------------------------------------------------------\n\n");
	fat_title();
	printf("TESTS ABOUT WRITE FUNCTION\n");
	reset();
	test_write();

	printf("\n-----------------------------------------------------------\n\n");
	fat_title();
	printf("TESTS ABOUT STRLEN FUNCTION\n");
	reset();
	test_strlen();

	printf("\n-----------------------------------------------------------\n\n");
	fat_title();
	printf("TESTS ABOUT STRCPY FUNCTION\n");
	reset();
	test_strcpy();

	printf("\n-----------------------------------------------------------\n\n");
	fat_title();
	printf("TESTS ABOUT STRDUP FUNCTION\n");
	reset();
	test_strdup();

	printf("\n-----------------------------------------------------------\n");
	printf("\t\t\t\t\tEnd of testing...\n");
	return (0);
}