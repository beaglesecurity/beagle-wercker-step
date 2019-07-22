# beagle-step
To trigger Beagle penetration testing from Wercker

## Prerequisites

* Obtain Application Token and Access Token from Beagle Dashboard
* Add the Environment variables `ACCESS_TOKEN` and `APPLICATION_TOKEN` to Wercker Project. 

### What is Beagle?

Beagle is an intelligent and holistic platform to make your applications hack-proof. The platform provides continuous and automated Penetration Testing (under human supervision) for organizations, so that they can always stay on top of the cyber threats.

In short, Beagle finds out how deep your system can be penetrated. Know it before the hackers do! 

* [Beagle Security](https://beaglesecurity.com/) - Visit for more Details!

### Generate your Access Token From Beagle User Settings:
  Settings -> Access token -> Generate your new personal access token

![Generate user token](https://beagle-assets.s3.ca-central-1.amazonaws.com/share/usertoken.png)

### Generate your Application Token From Beagle<br></h3>
  Home -> Applications -> Select your application -> Settings -> Application token

![Get application token](https://beagle-assets.s3.ca-central-1.amazonaws.com/share/apptoken.png)

## Setting up Environment

1. Open your Wercker project
2. Navigate to `Environment`
3. Add the environment variables `ACCESS_TOKEN` and `APPLICATION_TOKEN`, Check `Protected`(Recommended).
	* Ensure that the variable names are named as follows : `ACCESS_TOKEN`, `APPLICATION_TOKEN`
![environment](/images/1.png)

## Specifying the Variables in steps
```yaml
steps:
  - beaglesecurity/beagle-security@x.x.x:
      ACCESS_TOKEN:        <string> 
      APPLICATION_TOKEN: <string> 
```
* For `ACCESS_TOKEN` Replace `<string>` with `$ACCESS_TOKEN`
* For `APPLICATION_TOKEN` Replace `<string>` with `$APPLICATION_TOKEN`
* For Security Reasons it is always recommended to set tokens in your project environment. Never pass tokens as plaintext through steps!!

## Install curl
In order to use this step you've have to install `curl` in your `box`. If already installed skip this step. 
* For installing `curl`, for debian based `box` add the following snippet to your `wercker.yml` file's `steps:` of `yaml-pipeline-name:` section. 
```yaml
- install-packeges:
 packages: curl
```
* An example will look like this, my `yaml-pipeline-name` is `build`
```yaml
box: ubuntu
build:
 steps:
  - install-packages:
   packages: curl
```

## Full Example
```yaml
box: ubuntu
build:
 steps:
  - install-packages:
   packages: curl
  - beaglesecurity/beagle-security:
   ACCESS_TOKEN: $ACCESS_TOKEN 
   APPLICATION_TOKEN: $APPLICATION_TOKEN
``` 
## Notes
If you want to create a new pipline for beagle test trigger. Add the following snippet to your `wercker.yml` file.
```yaml
beagle-trigger:
 steps:
  - install-packages:
   packages: curl
  - beaglesecurity/beagle-security:
   ACCESS_TOKEN: $ACCESS_TOKEN 
   APPLICATION_TOKEN: $APPLICATION_TOKEN
``` 
* Create a new pipline from `workflow`. configure as follows
![pipline](/images/2.png)
* You can add this to your work flow, or your can trigger this after your build from `Actions`
![actions](/images/3.png)

# Authors

* **Beagle Security**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
