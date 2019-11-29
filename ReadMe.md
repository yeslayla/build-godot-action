# Build Godot

This action builds the godot project in your `$GITHUB_WORKSPACE`, so that you can easily automate builds.

## Usage

Example:

```yaml
steps:
- uses: josephbmanley/build-godot-action@develop
  env:
    PROJECT: godot-project
```

### Environment Variables

- #### PROJECT **REQUIRED**

    Name of the project files to output.

    Eg. `godot-project` will export to `godot-project.exe`

## Credits

This action uses the [godot-ci](https://github.com/aBARICHELLO/godot-ci) docker image from [BARICHELLO](https://github.com/aBARICHELLO)
