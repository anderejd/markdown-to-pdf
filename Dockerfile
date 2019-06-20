FROM rust:latest
RUN cargo install pulldown-cmark --version 0.5.2
RUN apt update
RUN apt install -y xvfb
RUN apt install -y wkhtmltopdf
WORKDIR pdf
COPY README.md .
CMD \
	cat README.md | pulldown-cmark > /output/README.html && \
	xvfb-run wkhtmltopdf \
		--margin-bottom 20 \
		--margin-top 20 \
		--margin-left 20 \
		--margin-right 20 \
		/output/README.html \
		/output/README.pdf
