import pathlib
import subprocess

import jinja2


def get_template(template_name):
    TEMPLATES_PATH = pathlib.Path(__file__).resolve().parent / "templates"
    loader = jinja2.FileSystemLoader(searchpath=TEMPLATES_PATH)
    env = jinja2.Environment(loader=loader)
    return env.get_template(template_name)


def render_template(template_name, data=None):
    template = get_template(template_name)
    return template.render(data=data)


def run_cmd(cmd: str) -> str:
    subprocess.run(
        cmd,
        shell=True,
        check=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        universal_newlines=True,
    )
