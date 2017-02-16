//
//  FeedItemSectionController.m
//  zues
//
//  Created by mac on 2017/2/16.
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

#import "FeedItemSectionController.h"
#import "FeedItem.h"
#import "LabelCell.h"
#import "UserHeaderView.h"
#import "User.h"

@implementation FeedItemSectionController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.supplementaryViewSource=self;
    }
    return self;
}

// MARK: IGlistSectionType
-(NSInteger)numberOfItems{
    return _feedItem.comments.count;
}

-(CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 55);
}

-(UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    LabelCell *cell=[self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.label.text=_feedItem.comments[index];
    return cell;
}

-(void)didUpdateToObject:(id)object{
    _feedItem=object;
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    return;
}

// MARK: IGListSupplementaryViewSource
-(NSArray<NSString *> *)supportedElementKinds{
    return @[UICollectionElementKindSectionHeader];
}

-(UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    UserHeaderView *view=[self.collectionContext dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader forSectionController:self nibName:@"UserHeaderView" bundle:nil atIndex:index];
    view.handleLabel.text = [NSString stringWithFormat:@"@%@",_feedItem.user.handle];
    view.nameLabel.text = _feedItem.user.name;
    return view;
}

-(CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind atIndex:(NSInteger)index{
    return CGSizeMake([self.collectionContext containerSize].width, 40);
}
@end
