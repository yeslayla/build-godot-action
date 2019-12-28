# Build Godot Project

This action builds the godot project in your `$GITHUB_WORKSPACE`, so that you can easily automate builds.

## Usage

This action will create a `build` folder an outputed build. You must have the export preset configured for the target platform to successfully export.

Example:

```yaml
steps:
- uses: josephbmanley/build-godot-action@[VERSION]
  with:
    name: godot-project
    preset: HTML5
```

### Inputs

#### name **required**

    The name of the exported package/binary

#### preset **required**

    The name of the preset found in `export_presets.cfg` you would like to build.

#### subdirectory

    *Optional*

    The subdirectory in the `build` folder to output build to, can be useful for self packaging.

#### package

    *Optional*

    Boolean value, when set to true, builds artficat zip file.

### Outputs

#### build

    The location the outputed build is placed.

#### artifact

    The location the outputed artifact is placed.


## Credits

This action uses the [godot-ci](https://github.com/aBARICHELLO/godot-ci) docker image from [BARICHELLO](https://github.com/aBARICHELLO)
