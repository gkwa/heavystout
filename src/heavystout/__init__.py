import pathlib

from . import main2

__project_name__ = "heavystout"


def main() -> int:
    templates = [
        pathlib.Path("t010.sh.j2"),
        pathlib.Path("t020.sh.j2"),
        pathlib.Path("t030.sh.j2"),
    ]
    for tpl in templates:
        script = pathlib.Path(f"{tpl.with_suffix('')}")
        script.write_text(main2.render_template(tpl.name))
        script.chmod(0o777)

    for script in pathlib.Path(".").glob("*.sh"):
        main2.run_cmd(f"shfmt -w -s -i 4 {script}")

    return 0
