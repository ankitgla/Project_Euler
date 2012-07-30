//
//  AppDelegate.m
//  test
//
//  Created by Ankit Bhardwaj on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.

    MasterViewController *masterViewController = [[[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil] autorelease];
    self.navigationController = [[[UINavigationController alloc] initWithRootViewController:masterViewController] autorelease];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    //[self Question1];
    //[self Question2];
    //[self Question3];
    //[self Question4];
    //[self Question5];
    //[self Question6];
    //[self Question7];
    //[self Question8];
    //[self Question9];
//    [self Question10]; // for question 10
    [self Question11];
    
    return YES;
}

- (void) Question1
{
    int limit = 1000;
    int i = 1;
    int sum = 0;
    while (i < limit) {
        if(i%3 == 0 || i%5 == 0)
            sum += i;
        i++;
    }
    printf("Total sum %d",sum);
}

- (void) Question2
{
    int limit = 4000000;
    int a = 1;
    int b = 2;
    int sum = 0;
    while (1) {
        if(b%2==0)
            sum += b;
        
        int c = a+b;
        if(c > limit)
            break;
        a = b;
        b = c;
        printf("%d ",c);

    }
     printf("%d ",sum);
}

- (void) Question3
{
    long long int limit = 600851475143;

    for (long long int i = 2; i*2 < limit; i++)
    {
        if([self isPrime:i])
        {
            long long int num = limit;
            while(num%i==0)
            {
                num /= i;
                printf("%lld \n",i);
            }
        }
    }
        
}

 
- (int) isPrime:(int) num
{
    int flag = 1;
    for(int i = 2 ; i*i <= num ; i++)
    {
        if(num%i == 0)
        {
            flag = 0;
            break;
        }
    }
    return flag;
}

- (void) Question4
{
    int num = 999;
    int max = 0;
    for (int i = num; i >= num/2 ; i--) {
        for (int j = i; j >= num/2 ; j--)
        {
            if([self isPalindrome:(i*j)])
            {
                max = i*j > max ? i*j :max;   
                printf("%d\n",max);
            }
            
        }
    }
    //[self isPalindrome:9801];
}

- (int) isPalindrome:(int) num
{
    int temp = num;
    int reverse = 0;
    while (temp) {
        reverse  = reverse *10 + temp%10;
        temp /= 10;
    }
    
    if (num == reverse)
        return 1;
    else
        return 0;
}

- (void) Question5
{
    int max = 1;
    while (1) {
        int i = 20;
        while (i) {
            if (max%i-- != 0)
                break;
        }
        if (i == 0)
        {   
            printf("%d",max);
            break;
        }
        max++;
    }
}

- (void) Question6
{
    int max = 100;
    
    int a = 0, b = 0; //a is for sum of square & b is for square of sum
    for (int i = 1; i <= max; i++)
    {
        a += i*i;
        b += i;
    }
    b = b*b;
    
    printf("%d", b - a);
    
}

- (void) Question7
{
    int limit = 10001;
    int count = 0;
    int start = 2;
    while (1) {
        if([self isPrime:start])
        {
            if (++count == limit)
                break;
        }
        start++;
    }
    printf("%d",start);
    
}

- (void) Question8
{
    NSString* s = @"7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450";
    
    int max = 1;
    // calculate for first five
    
    
    for(int i = 5; i < [s length]; i++)
    {
        int temp = 0;
        int last = [[s substringWithRange:NSMakeRange(i-1,1)] intValue];
        if(last == 0)
        {
            temp = [self calculateFive:[s substringWithRange:NSMakeRange(i, 5)]];
            i += 5;
            continue; 
        }
        else
            temp = [self calculateFive:[s substringWithRange:NSMakeRange(i-5, 5)]];
        
        max = temp > max ? temp : max;

    }
    printf("%d",max);
}

- (void) Question9
{
    // not correct
    for (int i = 1; i<1000 ; i++)
    {
        for (int j = 1; j<1000 ; j++)
        {
            int temp = i*i +j*j;
            float c = sqrt(temp);
            if(c - floorf(c))
                continue;
            else {
                if (i+j+c == 1000) {
                    printf("%f %d %d %f",i*j*c, i, j, c);
                    break;
                }
            }
        }
    }
}

- (int) calculateFive:(NSString*)s
{
    int val = 1;
    for (int i = 0; i < [s length]; i++) {
        val *= [[s substringWithRange:NSMakeRange(i, 1)] intValue];
    }
    return val;
}

- (void) Question10
{
    long long int limit = 20000000;
    long long int sum = 0;
    
    for(long long int i = 2; i <= limit; i++) {
        if([self isPrime:i])
        {
            printf("%lld  sum = %lld\n ",i, sum);
            sum += i;
        }
    }
    
    printf("%lld",sum);
}

- (void) Question11
{
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
