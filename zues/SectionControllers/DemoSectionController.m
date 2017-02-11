//
//  DemoSectionController.m
//  zues
//
//  Created by mac on 2017/2/11.
//  Copyright © 2017年 v. All rights reserved.
//
/**
 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "DemoSectionController.h"
#import "LabelCell.h"

@implementation DemoItem

- (instancetype)init:(NSString *)name controllerClass:(Class)controllerClass controllerIdentifier:(NSString *)controllerIdentifier
{
    self = [super init];
    if (self) {
        self.name=name;
        self.controllerClass=controllerClass;
        self.controllerIdentifier=controllerIdentifier;
    }
    return self;
}

// MARK: IGListDiffable
-(id<NSObject>)diffIdentifier{
    return _name;
}

//
-(BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object{
    if (self==object) {
        return YES;
    }
    // TODO: guard let object = object as? DemoItem else { return false }
    return _controllerClass == [(DemoItem *)object controllerClass] && _controllerIdentifier == [(DemoItem *)object controllerIdentifier];
}

@end

@implementation DemoSectionController

// MARK: IGListSectionType
-(NSInteger)numberOfItems{
    //相当于UITableView一个indexPath.setion中有几个row
    return 1;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    //返回cell大小
   return CGSizeMake([self.collectionContext containerSize].width, 55);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    //返回cell
    LabelCell *cell=[self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.label.text=_object.name;
    return cell;
}

-(void)didUpdateToObject:(id)object{
    //绑定model
    _object=object;
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    //一个row的点击事件
    if (_object.controllerIdentifier) {//跳转sb
        
    }
    else if (_object.controllerClass) {
        UIViewController *controller=[[_object.controllerClass alloc] init];
        controller.title=_object.name;
        [self.viewController.navigationController pushViewController:controller animated:YES];
    }
}

@end
