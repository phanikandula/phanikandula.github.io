clean:
	rm -rf build && \
	git worktree prune && \
	git worktree add -B gh-pages build origin/gh-pages


setup: clean
	npm install

generate: clean
	$(shell npm bin)/antora --html-url-extension-style indexify --fetch antora-playbook.yml && \
	cp static/CNAME build/docs/ && \
	touch build/docs/.nojekyll

generate-author: 
	$(shell npm bin)/antora author-playbook.yml && \
	cp static/CNAME build/docs/ && \
	touch build/docs/.nojekyll

preview:
	cd build/docs/ && python3 -m http.server

publish:
	cd build && \
	git add --all && \
	git commit -m "Publish new version" && \
	git push

