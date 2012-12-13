REPORTER = dot

test: 
	@NODE_ENV=test ./node_modules/.bin/mocha --reporter $(REPORTER)

test-w: 
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--reporter $(REPORTER) \
		--watch

test-cov: 
	@rm -r lib-cov 
	@jscoverage lib lib-cov
	@TEST_COV=1 $(MAKE) test REPORTER=html-cov > coverage.html

.PHONY: test test-w