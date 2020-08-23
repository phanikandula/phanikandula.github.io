clean:
	rm -rf build
	git worktree prune

setup: clean
	npm install
	git worktree add -B gh-pages build origin/gh-pages

generate:	
	$(npm bin)/antora antora-playbook.yml
	cp static/CNAME build/docs/
	cp static/.nojekyll build/docs/

publish:
	cd build &&
	git add --all &&
	git commit -m "Publish new version" &&
	git push