### Methoden 

Have Every approche in the Script ? 

1.  main script und different Script where you give your parameter from main to different script

2. Main Script to different script with output and Import 
    
    Prifix it with : Fn::ImportValue: !Sub ${VPCStackName}-ID
    !!Achtung export können nicht mehr geändert werden. !!

3. Nested Stack 
    github.com/cfn-modules 

4. Modules 
    Not for Serverless
    ModuleRegestry anlegen
    cfn init
    cfn validate
    cfn sumbit 


    Change sets allow you to see how proposed changes to a stack might impact your running resources before you implement them
    https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html

    


# AWS CloudFormation templates contain nine main objects:


Format:  version—defines the version of the template format (currently only one option, 2010-09-09)

Description—lets you specify comments about the template.

Metadata—lets you use JSON or YAML objects to add information.

Parameters—let you customize your template by adding or modifying custom values, before deployment and at runtime.

Mappings—lets you map keys to corresponding named values, which you specify in conditional parameters. To retrieve values from a map, you can use the Fn:: FindInMap intrinsic function.

Conditions—define the resources that are created and when their properties are assigned to values. This can happen during updates or stack creation.

Transform—builds an easy-to-use declarative language for CloudFormation and lets you reuse template components. Each template lets you declare a single or multiple transforms.

Resources—lets you declare which resources—such as 3 buckets or EC2 instances—should be used for the stack.

Output—describes the output values allowed to be imported into other stacks or values that should be returned when you view stack properties.