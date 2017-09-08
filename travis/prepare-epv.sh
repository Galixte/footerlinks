 #!/bin/bash
#
# PayPal Donation extension for the phpBB Forum Software package.
#
# @copyright (c) 2016 Matt Friedman
# @license GNU General Public License, version 2 (GPL-2.0)
#
set -e
set -x

DB=$1
TRAVIS_PHP_VERSION=$2

if [ "$DB" == "mysqli" -a "$TRAVIS_PHP_VERSION" == "5.5" ]
then
	cd phpBB
	composer remove sami/sami --update-with-dependencies --dev --no-interaction
	composer require phpbb/epv:dev-master --dev --no-interaction --ignore-platform-reqs
	cd ../
fi
