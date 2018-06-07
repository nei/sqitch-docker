FROM mysql:5.6

MAINTAINER Rodolfo Milanez <rodolfomilanez@gmail.com>

# Image & Squitch Deps
RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	build-essential \
	ca-certificates \
	cpanminus \
	curl \
	gcc \
	git \
	perl \
	perl-modules \
	libnss-sss \
	make \
	mysql-client \
	sqlite3 && \
	apt-get clean

# Install sqitch & deps
RUN apt-get install -y libdbd-mysql-perl && \
		PERL_MM_USE_DEFAULT=1 cpan App::Sqitch && \
		PERL_MM_USE_DEFAULT=1 cpan DBD::SQLite

# Set timezone
RUN TZ="Europe/London"

#Set LANG for perl
ENV LANG C

